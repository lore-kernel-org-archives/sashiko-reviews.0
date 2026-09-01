Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181563A6B71
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230588; cv=none; b=XF8MW7Yz0JaDC7+mDm2kxykavNne6oQL/AaTOCGCNMfT/3UEWFDbWqiA1JY4R7d0MJL7YAzWQljCJ4Fw0U2Wx/G5CKhjverAt7OcnQtmzGFN6k9K/ysn7YiVl0Mfz0WZY990r+Nw3PP+mangKMQKp5XKOC6h+//ElMmNCEHv/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230588; c=relaxed/simple;
	bh=sSqNFSEIRBnxWbpBl9DNQaV0K0s7qNoKhmjQApcnyt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mflas7ZI4sMFYHeI1g/k8WQF2PZ3Te3WEWnoIMXjpjQ7zJTUgKzOUvEySMBjm5C3i0pevcsdQi1xR79/12YF3nHiycf5c7UeANAWmjfYmnEU/zpQy5bNU4CIlu2n0aMx1+52pUVTK5v56rfFZSiyfwjU3+795RmThG01hwnrSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KgFlS97p; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KgFlS97p"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930c0f9c1b1so317643085a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788230570; x=1788835370; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiSGP8UCJwVnm4V+RqkD0yHeg4awqeThcks0aUo6ivg=;
        b=KgFlS97pgw727/rTS8axvJNY927XI1jpZrIS1Yln/DabEXSVjwXq7/BFu16O8ekisl
         ZQTZnM5SjNjmUTrUperFad9DsohMrhhOu0Bd8n+j4rfyuxKH9xOy/5/BksSKGAL9Tftl
         qzB1auyc5ANDrTlExXLJVcqr7lymI68e365a1MYny+tdBIIHHa6HUWvUXdSdmCXysKIs
         V9tHIS2lQEcywyjqsaIlrM4r1lTGDO7921GnzYtFw7baCKqoNrRLsPBMqPo/moFfrPsh
         snorccOF68vTuIHkLlxiLd3ZCMDgH5IVUTeYFhr4z31+dMo5trQwHKd3mD9CrQ7gz+/1
         mWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230570; x=1788835370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiSGP8UCJwVnm4V+RqkD0yHeg4awqeThcks0aUo6ivg=;
        b=tLlIdwVc9HpkpaMNZcaj8gH40RqppEBOovwAwRp1fjrwNTdKxTlPxFDYDN0EH2/uLN
         wzNcrVS14BE9H+diGdnCJgTQveJ7n1U42PPrFkvtR0ypzdiJxuZAASw/fOiDrUZ5uq/c
         EtZ34a2REl2EHNzuKs/uWdf2H6eSZMQWAjqgIiqO3T5CYabXeiSIPIzf1lhjN7Zon6lB
         dU7Ba2LSwtxWlVFGYn5jyUrHQwp0YlQgFIJ9m3RCBuE+eFRDcleq0vfQ14EyOpiWdfRS
         86FmWqsH7jTH+BK4nzQSU4aBG0M0LtGQRuGlT3mSdA6QOGTNV1CoJp7acKEz0rWSU0tt
         IQ1g==
X-Gm-Message-State: AFuF++nJ42p81swKdfk6HcH/KvKqMBNVkvOjvSQqlkZ02MH5keqVDHzd
	qwNbv4y/OWlRWmS09w4GrjuIELBpoXfJKP4+U3N7p8TDKauLfGLfWlrQeZya4cyI7UIE4SitUEB
	km8H9Xh8=
X-Gm-Gg: AR+sD12AZ2AJwNmrZvmLXgRfGL2B+gNo0nMrTY6heYMKOlhJ4QXQlRTJVLP7SpIJo2p
	ZbfStFRcniEK/Z0gObgwTqvm0pQ87MtNL+nxamp4xzlkKhR94yWYmX3IWjHYiHSF7h3a+bYiGjH
	YrX9eDw4lxt41FwZEKgqEb6FJu9Vnv8B4LpT7MVgAbsC+Z8DuYPYyQnW+HkUpmlKk6RbdFmuCPr
	a+jBkx66sy/Q1Ezg21O0I/HDqWdww4wio8/l9MsJsOuI4IEzYnIGuNRgC/Qtj9x4S3ougPvgJTw
	/axCWTts45gSenX2KUfXK3JUsdGQJkD2mS5ZcRxuGDjD9/xR5j9hTMQHJtVTvs84SIG3QDiBt/l
	Sq7D4CyKHnE21H7ACRbJhHdSlTo+ThRcNtLMjpI+pKPc9ob1JQfISz8ysYjGDffMhA+BlYuHh82
	hYD61hzmXaNlgMOnyDox9jOfOeNrWk0JIRtKHPuk4bZm6bEgR0EDQIrili2Zva
X-Received: by 2002:a05:620a:3703:b0:939:1fc6:3fd6 with SMTP id af79cd13be357-93948086f3emr719892985a.18.1788230569828;
        Mon, 31 Aug 2026 19:42:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917016ed4sm929269085a.9.2026.08.31.19.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:42:49 -0700 (PDT)
Message-ID: <cde3da8f-933a-41ef-b7b8-f78317ca2d67@riscstar.com>
Date: Mon, 31 Aug 2026 21:42:46 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-4-elder@riscstar.com>
 <20260901012128.2AC6E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901012128.2AC6E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The check in of_pci_verify_node() falsely flags compliant CardBus and PowerPC PCIe bridges as having an invalid device_type.

I was unfortunately not considering those types of bridges,
and don't have experience with (or access to) either.

In the devicetree code, of_bus_pci_match() does check for
device_type "pciex" but does not handle "cardbus" (at least,
not explicitly--the "default-flags" bus type might do the
right thing).

I would love to get some pointers from others on how to
do this correctly, but in any case I'll do a little more
research on this before I post version 4.

					-Alex

> --
> 
> commit 72a980b9469901bec37d04c04dd8de642179aa44
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces a runtime check to verify PCI devicetree nodes. It
> ensures that bridge devices have the "pci" device_type property and that
> endpoint devices do not.
> 
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index a51dff91b196d..1838a3109514c 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
> 
> [ ... ]
> 
>> @@ -1085,3 +1085,34 @@ int of_pci_get_equalization_presets(struct device *dev,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>> +
>> +/**
>> + * of_pci_verify_node - Sanity check some PCI device node properties
>> + * @pdev: The PCI device whose device node is checked
> [ ... ]
>> +void of_pci_verify_node(struct pci_dev *pdev)
>> +{
>> +	struct device_node *np = pci_device_to_OF_node(pdev);
>> +	bool device_is_bridge;
>> +	bool device_type_pci;
>> +
>> +	/* Nothing to check if there's no pre-existing devicetree node */
>> +	if (!np)
>> +		return;
>> +
>> +	device_is_bridge = pci_is_bridge(pdev);
>> +	device_type_pci = of_node_is_type(np, "pci");
>> +
>> +	/* Bridges should have device type "pci"; endpoints should not */
>> +	if (device_is_bridge == device_type_pci)
>> +		return;
>> +
>> +	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
>> +		device_is_bridge ? "bridge should" : "endpoint should not");
> 
> [Severity: Medium]
> Will this falsely flag compliant CardBus and PowerPC PCIe bridges as having an
> invalid device type?
> 
> The check in of_pci_verify_node() expects all bridges to have a device type of
> exactly "pci". However, valid PCI bridges can legitimately use "cardbus" or
> "pciex" as their device_type property.
> 
> When a PCI bridge with one of these valid types is added, the following call
> chain unconditionally triggers this error:
> 
> pci_bus_add_device()
>    of_pci_verify_node()
> 
> This could emit a false dev_err() during boot on platforms using these
> standard bridges, which might alarm users by polluting the kernel logs.
> 
>> +}
> 

