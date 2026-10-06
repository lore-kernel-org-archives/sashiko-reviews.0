Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427733B14A9
	for <sashiko-reviews@lists.linux.dev>; Tue,  6 Oct 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286735; cv=none; b=a6yNmyJTeZjlULpBMXJ0Tn2HtId9AkLzmSoYcST3vj6ycr++yvrY1F6ZBOJ189A9T16nK8Iyk16qFMl4ZVv8wxcElFqOr9QRE+kUPdQSAZmbwm3GNTSNEteYvrM/UoksTRn7BgCMaClmKCJGmO4E9LFG9B49NxeTMFen9FHtjmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286735; c=relaxed/simple;
	bh=2zOaI/Z8e1drzDVrD9ua/LHiKbHe+SYveww2HsYsFEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNGUMcw7osGnc++SRoQ71Ne0ATqWLgKxvAhfQ+SCG7K/JTA+nyGs2CxNt3UhrG9HNK+JRWCXGbRMJ7cYFGkt92/UvTskHSZC4v07rcyzFPaYb8kuyz6ZeSolyYrKiR2sT52iuzgCZ58/HcHib6cag8VdMn9lPI4im2lozinbH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M6/HNBw6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M6/HNBw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791286733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDW3vzyRoZqymSPRfQkop/cgLakUVwx8htt1ibae5gU=;
	b=M6/HNBw6KynajF2vBwDBrOWOgLTBJLtXwLDBNx14KOjR272PvcrMkWDzDLza5Uuitpf1Aj
	FwaaWGip5GQKlBAmQhVFYGziCHgtPZ4e/EsTlFra9veHXh7ohaUnaDFpy63UE4KThzTsrJ
	2uRYjVepto7vfz4TIl2+cYhrf5Hlh10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-X4UXBXprPq6PHDI7zvqJsw-1; Tue, 06 Oct 2026 07:38:50 -0400
X-MC-Unique: X4UXBXprPq6PHDI7zvqJsw-1
X-Mimecast-MFC-AGG-ID: X4UXBXprPq6PHDI7zvqJsw_1791286729
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso1581079f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 04:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286729; x=1791891529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDW3vzyRoZqymSPRfQkop/cgLakUVwx8htt1ibae5gU=;
        b=rVpYEKXdmK+ifcaZoqJ+oS1Qud64YA0vwFAjWfrX892qMO1OQ/Hp470927a/SsjcI7
         bEI5AfA1iwVZuvlCZgpzBEwoQbcwe0IDg0zrBwNJA/FvfTotduqV3b9+3zzExFvxut+W
         n42QvuVKPyceucNrNDxNkvNfRNHPVYur7dchmkFaY7T8FnUyPuZAQsplf2fQvj9E8XSa
         FA6wiELb4cfpfWwwdK6LD3KAmeDAUUFRjqah2zbQGAly1t0TOxn0xX01+uMA2hC/GJ7c
         JdCAnoCe2fdEFK9QMa2b2aEVFYUv3p172X/t6NPMLnYPJRzL/CICtgfxgS+JfBVQf6mP
         qctw==
X-Gm-Message-State: AFuF++m4pEhRmPtOxHgnnmMJE20C2hc6CbO5KzXDTOOadUDCDgzwfCoa
	zC+/DIi1EEzFyn7voh9mQ3S2IxuQFJhhZoOLMOJN60A++pfnLJg4FSA1eoO1tMYuD6ahxz9R0de
	0LV+yH8aij9JGNvbru8ytOhsqegGmhC+iu6wmWPx0AoeZHcAeLDgo3lZe+HJTJ54e/WZcZ0NIkQ
	P3Qdf2MQhZl2XkoWeNtesxbBx1QDU9Cm0jZ31PkI3tg87prDP7Vw==
X-Gm-Gg: AYBFou26gtl6ZZwIfzwQqQwMF9+z84d+HHrbYw54QraTu2TADe1ypZcHVri/r0b44jt
	PYpanEWLzkMcM0ulP1VnEXcyF0MmyHaVltVzEopD8bpeoBokkeDuXFmf4QQMLZDyb34Tz5j9ZEz
	2TMv6ElBxZ1kVHRztilgZtesSnjsyHewCo7p9D5liWyRcQGAVajS39DKvXFsKb0BlSmJtn/MQBG
	K81yv+b97bwOI1X8pKdk4y6LpJuXEggXj5O9qFoBXcU+2VT5DZlN2dw9/U80xIGZq4gYVkfC918
	XEZX3ah04v7Gs/8gC06Dl6DZ9v+9lp2Q5VthsTqfQ5/mWh0g0dc8JcJ5iCrJaw==
X-Received: by 2002:a05:600c:4e45:b0:4a1:687b:8f3d with SMTP id 5b1f17b1804b1-4a17b55ad69mr16882365e9.31.1791286728743;
        Tue, 06 Oct 2026 04:38:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4e45:b0:4a1:687b:8f3d with SMTP id 5b1f17b1804b1-4a17b55ad69mr16882015e9.31.1791286728262;
        Tue, 06 Oct 2026 04:38:48 -0700 (PDT)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm341298485e9.0.2026.10.06.04.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:38:47 -0700 (PDT)
Message-ID: <21e0965d-d247-49b2-86fa-041ead3d8558@redhat.com>
Date: Tue, 6 Oct 2026 13:38:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 09/10] ice: program multicast magic wake before
 tearing down the main VSI
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, intel-wired-lan@lists.osuosl.org
References: <20261002130752.2597259-1-poros@redhat.com>
 <20261002130752.2597259-10-poros@redhat.com>
 <20261002132815.D3A771F000FF@smtp.kernel.org>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261002132815.D3A771F000FF@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DqJAMdl4ANvD_-MNLSb-l_yKoF6Hu9zsf1wYlCuYs0I_1791286729
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/2/26 15:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: Use-After-Free in ice_setup_mc_magic_wake() during concurrent devlink reload
> --
>
> commit 6cf8b519dd4de7f3996192dbff4ffe7afc4d34f8
> Author: Petr Oros <poros@redhat.com>
>
> ice: program multicast magic wake before tearing down the main VSI
>
> This commit moves the ice_setup_mc_magic_wake() call earlier in ice_remove()
> before device structures are torn down. It fixes an issue where WoL magic
> packet wake was not set up correctly because it was being called after
> ice_deinit().
>
>> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
>> index b121faa345c1a..857ba7d92b140 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_main.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
>> @@ -5465,6 +5465,8 @@ static void ice_remove(struct pci_dev *pdev)
>>   	if (!ice_is_safe_mode(pf))
>>   		ice_remove_arfs(pf);
>>   
>> +	ice_setup_mc_magic_wake(pf);
>> +
>>   	devl_lock(priv_to_devlink(pf));
> [Severity: High]
> By moving ice_setup_mc_magic_wake() outside of devl_lock(), is it exposed to
> concurrent devlink operations like reload?
>
> If a devlink reload operation executes concurrently with the driver's removal
> routine when Wake-on-LAN is enabled, the reload can call ice_unload() and
> ice_decfg_netdev(). This unregisters and frees the netdev.

A devlink reload can not run concurrently with ice_remove(). Since
commit bf6b200bc80d18 ("devlink: Acquire device lock during reload
command") the reload takes the device lock before the devlink instance
lock, and both the PCI unbind path and device_shutdown() hold that same
device lock for the whole of ice_remove().

>
> When ice_setup_mc_magic_wake() runs unprotected by the devlink lock, can it
> experience a use-after-free when attempting to read the freed netdev's MAC
> address?
>
> drivers/net/ethernet/intel/ice/ice_main.c:ice_setup_mc_magic_wake() {
>      ...
> 	if (vsi->netdev)
> 		ether_addr_copy(mac_addr, vsi->netdev->dev_addr);
>      ...
> }
>
> Would it be safer to place the ice_setup_mc_magic_wake() call after acquiring
> the devlink lock?
No, the netdev can not go away underneath ice_setup_mc_magic_wake()
regardless of where the devlink lock is taken in ice_remove().

>
>>   	ice_dealloc_all_dynamic_ports(pf);
>>   	ice_deinit_devlink(pf);
>> @@ -5475,7 +5477,6 @@ static void ice_remove(struct pci_dev *pdev)
>>   	ice_deinit(pf);
>>   	ice_vsi_release_all(pf);
>>   
>> -	ice_setup_mc_magic_wake(pf);
>>   	ice_set_wake(pf);
>>   
>>   	ice_adapter_put(pdev);

