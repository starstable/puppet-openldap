Puppet::Type.newtype(:openldap_module) do
  @doc = "Manages OpenLDAP modules."

  ensurable

  newparam(:name) do
    desc "The default namevar."
  end

  newparam(:target) do
  end
  
  newparam(:modulepath) do
    desc "The moduleload path, where to find modules to be dynamically loaded"
  end

end

