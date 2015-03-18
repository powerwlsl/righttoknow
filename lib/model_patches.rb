# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
# Define which state each authority belongs in
      PublicBody.class_eval do
      # ACT (only has state, no councils)
          def actstate?
            return self.has_tag?('ACT_state')
          end
      # NSW
          # NSW State
          def nswstate?
            return self.has_tag?('NSW_state')
          end
          # NSW Council
          def nswcouncil?
            return self.has_tag?('NSW_council')
          end
      # NT
          #NT State
          def ntstate?
            return self.has_tag?('NT_state')
          end
          # NT Council
          def ntcouncil?
            return self.has_tag?('NT_council')
          end
      #QLD
          # QLD State
          def qldstate?
            return self.has_tag?('QLD_state')
          end
          # QLD Council
          def qldcouncil?
            return self.has_tag?('QLD_council')
          end
      #SA
          # SA State
          def sastate?
            return self.has_tag?('SA_state')
          end
          # SA Council
          def sacouncil?
            return self.has_tag?('SA_council')
          end
      #TAS
          # TAS State
          def tasstate?
            return self.has_tag?('TAS_state')
          end
          # TAS Council
          def tascouncil?
            return self.has_tag?('TAS_council')
          end
      #VIC
          # VIC State
          def vicstate?
            return self.has_tag?('VIC_state')
          end
          # VIC Council
          def viccouncil?
            return self.has_tag?('VIC_council')
          end
      #WA
          # WA State
          def wastate?
            return self.has_tag?('WA_state')
          end
          # WA Council
          def wacouncil?
            return self.has_tag?('WA_council')
          end
      # Federal
      # This is a backup in case the law changes, we can easily modify it here
          def federalbody?
            return self.has_tag?('federal')
          end
      end


# This uses the defintions above to determine the name of the relevant law
    InfoRequest.class_eval do
      # Two sorts of laws for requests, FOI or EIR
      def law_used_full
        # ACT
          if self.public_body.actstate?
            return _("Freedom of Information")
        # NSW
          elsif self.public_body.nswstate?
            return _("Government Information (Public Access)")
          elsif self.public_body.nswcouncil?
            return _("Government Information (Public Access)")
        # NT
          elsif self.public_body.ntstate?
            return _("Freedom of Information")
          elsif self.public_body.ntcouncil?
            return _("Freedom of Information")
        # QLD
          elsif self.public_body.qldstate?
            return _("Right to Information")
          elsif self.public_body.ntcouncil?
            return _("Right to Information")
        # SA
          elsif self.public_body.sastate?
            return _("Freedom of Information")
          elsif self.public_body.sacouncil?
            return _("Freedom of Information")
        # TAS
          elsif self.public_body.tasstate?
            return _("Right to Information")
          elsif self.public_body.tascouncil?
            return _("Right to Information")
        # VIC
          elsif self.public_body.vicstate?
            return _("Freedom of Information")
          elsif self.public_body.viccouncil?
            return _("Freedom of Information")
        # WA
          elsif self.public_body.wastate?
            return _("Freedom of Information")
          elsif self.public_body.wacouncil?
            return _("Freedom of Information")
        # Fallback
          elsif self.law_used == 'foi'
              return _("Freedom of Information")
          elsif self.law_used == 'eir'
              return _("Environmental Information Regulations")
          else
              raise "Unknown law used '" + self.law_used + "'"
          end
      end
      def law_used_short
        # ACT
          if self.public_body.actstate?
            return _("FOI")
        # NSW
          elsif self.public_body.nswstate?
            return _("GIPA")
          elsif self.public_body.nswcouncil?
                return _("GIPA")
        # NT
          elsif self.public_body.ntstate?
            return _("FOI")
          elsif self.public_body.ntcouncil?
            return _("FOI")
        # QLD
          elsif self.public_body.qldstate?
            return _("RTI")
          elsif self.public_body.ntcouncil?
            return _("RTI")
        # SA
          elsif self.public_body.sastate?
            return _("FOI")
          elsif self.public_body.sacouncil?
            return _("FOI")
        # TAS
          elsif self.public_body.tasstate?
            return _("RTI")
          elsif self.public_body.tascouncil?
            return _("RTI")
        # VIC
          elsif self.public_body.vicstate?
            return _("FOI")
          elsif self.public_body.viccouncil?
            return _("FOI")
        # WA
          elsif self.public_body.wastate?
            return _("FOI")
          elsif self.public_body.wacouncil?
            return _("FOI")
        # Fallback
          elsif self.law_used == 'foi'
              return _("FOI")
          elsif self.law_used == 'eir'
              return _("EIR")
          else
              raise "Unknown law used '" + self.law_used + "'"
          end
      end
      def law_used_act
        # ACT
          if self.public_body.actstate?
            return _("Freedom of Information Act 1989 (ACT)")
        # NSW
          elsif self.public_body.nswstate?
              return _("Government Information (Public Access) Act 2009 (NSW)")
          elsif self.public_body.nswcouncil?
              return _("Government Information (Public Access) Act 2009 (NSW)")
        # NT
          elsif self.public_body.ntstate?
              return _("Information Act (NT)")
          elsif self.public_body.ntcouncil?
              return _("Information Act (NT)")
        # QLD
          elsif self.public_body.qldstate?
              return _("Right to Information Act 2009 (QLD)")
          elsif self.public_body.ntcouncil?
              return _("Right to Information Act 2009 (QLD)")
        # SA
          elsif self.public_body.sastate?
              return _("Freedom of Information Act 1991 (SA)")
          elsif self.public_body.sacouncil?
              return _("Freedom of Information Act 1991 (SA)")
        # TAS
          elsif self.public_body.tasstate?
              return _("Right to Information Act 2009 (QLD)")
          elsif self.public_body.tascouncil?
              return _("Right to Information Act 2009 (QLD)")
        # VIC
          elsif self.public_body.vicstate?
              return _("Freedom of Information Act 1982 (VIC)")
          elsif self.public_body.viccouncil?
              return _("Freedom of Information Act 1982 (VIC)")
        # WA
          elsif self.public_body.wastate?
              return _("Freedom of Information Act 1992 (WA)")
          elsif self.public_body.wacouncil?
              return _("Freedom of Information Act 1992 (WA)")
        # Fallback
          elsif self.law_used == 'foi'
              return _("Freedom of Information Act")
          elsif self.law_used == 'eir'
              return _("Environmental Information Regulations")
          else
              raise "Unknown law used '" + self.law_used + "'"
          end
      end
      def law_used_with_a
        # ACT
          if self.public_body.actstate?
            return _("A Freedom of Information request")
        # NSW
          elsif self.public_body.nswstate?
              return _("A Government Information (Public Access) request")
          elsif self.public_body.nswcouncil?
            return _("A Government Information (Public Access) request")
        # NT
          elsif self.public_body.ntstate?
            return _("A Freedom of Information request")
          elsif self.public_body.ntcouncil?
            return _("A Freedom of Information request")
        # QLD
          elsif self.public_body.qldstate?
            return _("A Right to Information request")
          elsif self.public_body.qldcouncil?
            return _("A Right to Information request")
        # TAS
          elsif self.public_body.tasstate?
            return _("A Right to Information request")
          elsif self.public_body.tascouncil?
            return _("A Right to Information request")
        # SA
          elsif self.public_body.sastate?
            return _("A Freedom of Information request")
          elsif self.public_body.sacouncil?
            return _("A Freedom of Information request")
        # VIC
          elsif self.public_body.vicstate?
            return _("A Freedom of Information request")
          elsif self.public_body.viccouncil?
            return _("A Freedom of Information request")
        # WA
          elsif self.public_body.wastate?
            return _("A Freedom of Information request")
          elsif self.public_body.wacouncil?
            return _("A Freedom of Information request")
        # Fallback
          elsif self.law_used == 'foi'
              return _("A Freedom of Information request")
          elsif self.law_used == 'eir'
              return _("An Environmental Information Regulations request")
          else
              raise "Unknown law used '" + self.law_used + "'"
          end
      end
end
