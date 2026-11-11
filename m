Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395478;
	b=vzdWCGnRkX0zl3uNlVF1m9JPOGX1r066zyoAiKTS5kvniMUPWIVz8GQWpOtJEsIwa+q0
	 mNEqeSi4Ydj5WLDKJk2fxwB8lKzzYK1qcDGDFk2tifUPU2qEzZ3RPE2oveMdnicKZEwko
	 f1f41Fas9Lg/8qBtmt0iz366GFLm8Ep5hy5eaZluaQK0Sb5M5K1nQY82Zixo+iGBcsdC2
	 63Tdoe7HY33RWf6IneJg5L2WyR2iXOxy0tLFy1WvIcTUgRz8Qx/8wXE3Seljmv7edbKSm
	 4IA5uuIrCEHfiNVlB0/PhduPtYoCBK2tLM6kL7kF/xN5EOnWAsS3ZUC6IdwJBABf+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395478;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=Rp/bVGLD3Hu4GX8rmkPcKIk9iXQY7yCw/hdUf9azH8Q=;
	b=d3rkpIaIrwd5enzTtjP/9u92p0hg/+WxqUnAnV1NJQf2257w2XKI1lTxTnB89WC51JkP
	 yQHphb6iC2uatyXZfFDwUL42aoOsbi3RGMntd+h6/ChsntFraLiTm0RHTuNG56JJQxFAH
	 nBA+/ljo1jGg+Nm9JaEeJoLLvMaybfecMFXxEeB9Wv8/GdYNPzdDSCwNmUvh64hOO0F6V
	 k/ouzTaKZCChyrlwGjrU8ctmSdJsPeTVjfn9xL9vbGkL3o7YMkQ9PvOI0I50B6Y4wJnVN
	 p2fFlKzqqhvXr+cLksQZfs0ETo2p6EkVvjxL5WsTJMjJksIOnO3Dx5ij9DqB6MbQcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=adzmzsXh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC5606A8A5
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFC5606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=adzmzsXh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794395476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rp/bVGLD3Hu4GX8rmkPcKIk9iXQY7yCw/hdUf9azH8Q=;
	b=adzmzsXh57OEqV8bixblWp1bBGLcVja3qsgjYN4UMU8inwDO0x02H+hE5qWxP36EkbkCLP
	MTTwuyBNLj/fxjK9apZry5ZzIN+EFG+8r+Fy1hbBITnepLlftucJqJcfGgh0yKBfZI44Ua
	8KsFPLLC+UtIaRjqmHF3yJbRsroWywc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-wRYvuWRePkGJU8Nsa9FDjg-1; Wed,
 11 Nov 2026 06:11:14 -0500
X-MC-Unique: wRYvuWRePkGJU8Nsa9FDjg-1
X-Mimecast-MFC-AGG-ID: wRYvuWRePkGJU8Nsa9FDjg_1794395473
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 108D0180060B;
	Wed, 11 Nov 2026 11:11:13 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 285791956087;
	Wed, 11 Nov 2026 11:11:11 +0000 (UTC)
Message-ID: <3ab31a32-2517-449d-8891-9216f5f83636@redhat.com>
Date: Wed, 11 Nov 2026 12:11:10 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] ice: dpll: serialize changes of the SyncE CGU
 registers
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20261110094350.184185-1-ivecera@redhat.com>
 <20261110094350.184185-2-ivecera@redhat.com>
 <sashiko-outbox-208713@kernel.org>
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <sashiko-outbox-208713@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: VmvT5-WOZ8Y4LXTbUV2dPMrkAeOZB_5TUDNS3G4bZVQ_1794395473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] ice: wrong port modulo in ice_tspll_bypass_mux_active_e825c()
>    [1]
> --
> 
> commit 54d93c3b2bb6d3588addc95fab52eae6473a669b
> Author: Ivan Vecera <ivecera@redhat.com>
> 
> ice: dpll: serialize changes of the SyncE CGU registers
> 
> This commit adds a mutex to struct ice_adapter to serialize read-modify-write
> updates to the shared E825C SyncE CGU registers R10 and R11 across PFs.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> index 7980eaf9ce253..449819cf8c879 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> @@ -1368,7 +1368,9 @@ void ice_ptp_link_change(struct ice_pf *pf, bool linkup)
>>   				break;
>>   			}
>>   
>> +			mutex_lock(&pf->adapter->cgu_synce_lock);
>>   			err = ice_tspll_cfg_synce_ethdiv_e825c(hw, clk_pin);
>> +			mutex_unlock(&pf->adapter->cgu_synce_lock);
>>   			if (active && err) {
>>   				dev_err_once(ice_pf_to_dev(pf),
>>   					     "Failed to configure SyncE ETH divider for pin %d, err %d\n",
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does
> ice_tspll_bypass_mux_active_e825c() compute the wrong port index when setting
> active here [1]?

Yes. Patch 2/2 of this series fixes it, the check now compares with
port + ICE_CGU_BYPASS_MUX_OFFSET_E825C, as
ice_tspll_cfg_bypass_mux_e825c() and ice_dpll_rclk_update_e825c() do.

Thanks,
Ivan

