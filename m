Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C728481A94
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284757; cv=none; b=OKvvaT9YegLDjTKzwxjmpRb7b5n55MNy3d02I2k7fxotpyjGvYBr5BT0gZ8LwRB3m8c0ae0+00TF00Q3TvrYpYDtNvxgKNLQM35ioHxyg8e0hHiOFYx87uqnJ/6pcq546Bq5WHSkleiagJm2gpqukzhwITX7HjyTzHcIPAZdZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284757; c=relaxed/simple;
	bh=9gN6qw0vJ5l/AthNPXEYu67DRbQvRWzAXeVYsxWq9rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZelmN9BS0VYbWRo1o5ZwKMFd57cRGmZwV416L89MXIeeUeRByiqV94w2v7UVOM1QP7HNUVTywqsW/8psy/R1HxkJ4Vy2OMZIrPMW6z8AMiL2wXMFXsRyPh2rrmvXgfbIxJ2/qCArTGzfbCRA47VR5w2uYeS4FwrelpppFQm+Uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ExeVQfbR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ExeVQfbR"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93959320373so13419785a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788284754; x=1788889554; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4urxLv//MTT17qiTaqXXkanTI4Y6EUbnjG2xxOzUII=;
        b=ExeVQfbRsBa/z7n9PLgQ35lQRPI5+Xtk1Zr/VwaBseYoInnrIOrrUr8dzGGl/UAxcC
         opAE3lG5H2afPJGn8C81qHJvcLmM/nrCVN0Kdx52RickQK8BPVQ1VSDmWAZPIe8b8FMd
         lRvsoVaZU6laqw2ZTO11YKDezTk9cDZtGWo5y7Ecw7uikkilfRjpMEKzyXiAB96wQqj+
         jVciCuHLSm1/PYAp7slV02U6hAf3CaSa8GoBrQ6BXBZG6Yp4Cx3SiwKQ+lBao8fgTKsg
         UFvYncgey/K0uKB61AZE2hUk26L4EP+YAC0m/NOUmTjMXM0sr7MYD5yIiJFtOiu/9vQV
         RAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284754; x=1788889554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4urxLv//MTT17qiTaqXXkanTI4Y6EUbnjG2xxOzUII=;
        b=QyWZLzC6hVFJlhWdBZOHn4tnghrIqae/+MteGueaRqCKJA8FUaMO8uL5K8vPThcfR7
         7LOpX6TQijmpmpdSqsPQbai49a6up2w2C+hAtWlmyo4tcWhZoeWPzdDkhIycVhcRYtg/
         AExnWurZVDEGxiBU6wR2yHHfU8AcEcAOyXukhFrbTmdfoPzLw4FY/P87Yh6mjsrelGEn
         cRsv/O/hTvHKdzbsF4SEp87ENAB6lYjDMmRHE3kve2UDNFdKP+OCYQMXwHHlttM1p9fX
         gYjaP8/j4APMSL7ewv+maqZkdDDXTQfW8UDemeXM2XtezY2Cx+aU5funSo6ICIStjzWb
         6nCg==
X-Gm-Message-State: AFuF++mZXoxpoH03lZR3AMU0SUfPM+LW59lsNZ8qYs/VujZJ2a4MXcbt
	Swu6AEuIAW+fiRDdgNJE1eZzJAtufGikNFyOki6VQ0oSyxNBenCe7dzg6Wvk+MNbG6s3angP+Bx
	VSAsY2uQ=
X-Gm-Gg: AR+sD13UXwS7Ch3TlUXyBlcv+NCzHzvkc3c9Us8TKVFPFvtXKleACIH9rRebloBExwa
	fjoPHF5Ml4PBjczOBGEPwUEIu6KrFZ6/t83Cnh8jqrMzf3MCQgAALmWAziqQBpwpr3NL+XsEWhj
	FgAEbC+sWrq6Vt6nylh08Ss7DMwCIJ14JBUyAUOlsHIoK0LaBl27RgqWbgP+YQxKT7zhxfX5vQm
	k65l9pwE12+Wi9IJQGDxp+wahs5PT30bW4z3S2jG+NLnvkuGoM62lUlCQYmXJ7r+Bh+nGSbi0iH
	8IkT4USnj6JbuUtRnoIAH3Z3Aixvc0u6jT9ku49S5Kq4QgMSFH5O1tEsTY7MKi4weuBbU1tWW4M
	nAzvEtfrZCHpZf9qXv0S6lMg0+rfurM6voUSOxJkX2mRfszlFxSjZxt0upBE99qso9CNWlmeyiN
	IUoqLMW8SSjc5FVexXP4yRG/6pQYGYJ51xPtZcnByoFNwf4hT2UHmQPmpk9UWl
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr1322529385a.42.1788284753970;
        Tue, 01 Sep 2026 10:45:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a735asm1080527085a.28.2026.09.01.10.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 10:45:53 -0700 (PDT)
Message-ID: <04549e98-7f05-4d2e-8b08-d42f44c1daa4@riscstar.com>
Date: Tue, 1 Sep 2026 12:45:52 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device
 nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
 <20260901173941.294E01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901173941.294E01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Conceptual Flaw / False Premise: Renaming the node does not prevent it from being treated as a PCI bus because `device_type = "pci"` is still present.
> --
> 
> commit 3cd795cb2f33ffae376d5bceb9ba0da490602d05
> Author: Alex Elder <elder@riscstar.com>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
> 
> This commit renames devicetree nodes from pcie@ to pci@ with the intent of
> stopping the embedded PCIe endpoints from being treated as PCI buses by the
> devicetree parsing code.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index a13315bf0fb07..99a985a177a61 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -954,7 +954,7 @@ pcie@3,0 {
>>   			ranges;
>>   			bus-range = <0x5 0xff>;
>>   
>> -			pcie@0,0 {
>> +			pci@0,0 {
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>>   				#address-cells = <3>;
>>   				#size-cells = <2>;
>>   				device_type = "pci";
> 
> [Severity: Medium]
> Does this node rename actually prevent the devicetree parsing code from
> treating it as a PCI bus?

This patch (series) is being done separate from another pre-existing
series that addresses that particular issue.  I suppose once that
is merged I can re-issue this one.

   https://lore.kernel.org/lkml/20260901013654.1343537-1-elder@riscstar.com/

It looks like I might get a similar comment from Sashiko on other
patches in this series... I won't respond to any others unless what
is noted differs from what I've explained here.

					-Alex

> The commit message indicates that renaming the node away from pcie@ will stop
> of_node_is_pcie() from matching it. However, because this node explicitly
> specifies device_type = "pci", of_bus_pci_match() in drivers/of/address.c
> will still return true immediately.
> 
> When evaluating buses, of_bus_pci_match() checks:
> 
>      of_node_is_type(np, "pci") || of_node_is_pcie(np)
> 
> Since the device type is explicitly "pci", the match succeeds before
> of_node_is_pcie() is evaluated. Should device_type = "pci" also be removed to
> actually prevent this endpoint from being treated as a PCI bridge?
> 
> [ ... ]
> 

