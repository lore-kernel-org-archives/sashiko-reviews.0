Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A083DB97A
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228219; cv=none; b=OO1qxx3AV5AdVtAnMb700x8bR+vMrr4FmaICI3gipHseUd+hMirnH0SBBnzcFicMqVDCaORu0yjs4TGbb2LEps63+ywQO/lbOs+7/8lqWXLRCRwIuQAH2wjbK4UsgvRGk4lUMhCB3oCaSB2O7nuLuDBUR07xBrO4l+3gKzYWfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228219; c=relaxed/simple;
	bh=TX6r7q1YQURmuBkaszMdOQ7QsmdJGZBe7gLlm0x5dJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPdGi9GdEGKyfeMagyWtqwXHMbGRzAZDIF7WLtT59vY/sQhWWjv+6o4igSV3cNqjfuNuoJ7rvDyLBHHw7fQU+R36NvDtUPaECQ/hmOwEVolOin/klg9kcqCxMFx37uG2tJkNDjepO6O5yNAIPBaEGSxsKDSazTn0w69gWLDYwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=NqXTKBfq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="NqXTKBfq"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52f9e79ed93so41169881cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788228194; x=1788832994; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEaLnco64T9D+NWKBTWVLYxPTE2JIhEmYG1CXe1LYlI=;
        b=NqXTKBfqHrvsB9WiQja4hPJdu4A3VIbBDTTcx1QM0eEgq/B/mtDo7g9ZFV424crs6D
         TudKIFpK6mx9L0CmJpzNz4eKkcQApmdi69GGTtfA9ThDus/folnP1U2xw0olRDvswqMY
         62RUjhvq9rtaq45jpWMSvDU5C1j7dLpoZDXgEAF+NzQWsWzEP7GUgKviHAF1A+1j08PZ
         /9RQ7wlx5YVsnVZ/GFwNVmCpI9Wytg0I4J+Vjnh05aWBZHew3y8WZCMW9cIRDYGBJ4vN
         1g5/3CIMGBQniYDtT6egvWzmWHjk5MkRQzaIKIFjBzQsrFtKM8v4Wm+VjOuNW8EPr8FK
         jYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228194; x=1788832994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEaLnco64T9D+NWKBTWVLYxPTE2JIhEmYG1CXe1LYlI=;
        b=HsIlFv38NqsrIT221tZz7VIEUqZ3UtReUd7zcqTZR3CFXJ0DTIsersLpcPDihPFbwZ
         glq6UsIdUZ2WN0PsCDsdvd3hsN9sAhnBJCfKANaba6U5ZDsNLRdWZngh1MGawIEAVgV8
         PkIMCGPDFOuGk7n1qlwrkw8jrkjaXjvma4BUS67/VVUJMhi70m6sLH52OMPjhJSg27wg
         cpLEvrEpFEjDgf2mZKqNz3otfSew+6OfJWjLVqDVzxtPol6mY9uqjuc5Hiw+dkBXSByK
         FLVHvtB4eLzZ5sJ5/+TAINCh+si6J4ARRd2AAses62m9sXI1S3dO2CSr5u0CnJ9mFepb
         Dh3Q==
X-Gm-Message-State: AFuF++kOGD4b15W2qo3jRw3xHZGB33WL0kWjH1i/VJsPsWDQ7pyW6Q8G
	rPTRiHcJuCeY+9pDFI4O4x/MNoj2ZSxHnIAkgWTf++dKYW9DuWSt4MjDLe642O3oC8i3to1KdKs
	mkalB3U8=
X-Gm-Gg: AR+sD11y5YSjrPS61FLyNsESn0nXzmOdBuOgb3ukHbX75JfsJUFRJsIkAKoleWs1EQo
	w7tmprnTwZiD2U4O2XBkLmW/nP86STYZdSF4ebXoRujZJURCRjVFEfIIy/hnh6qs3zstXDTHJMi
	OknBYRGMHssylvxzpUA+T0Q9I1Tf2ucr2WeLCGWigx6klSi07K4fHsW/xBk7Y2aPGNsgO/BUAW4
	wkfI9uwxTLPI622bpbcXI5w81+6hR/vZMTc5Dk28QLsbCm17kTxretTtTXNA1eerzUJCTML5Nnw
	dP3NLyUUijyO5VDumUj8qPh8BRti34PmzEfbBD8cTeY4HPmU6zV14meFqY1Zyg1D3BUjCo0ur9I
	UtwMYiP/nLRKLoB6O6x5gmz9t1wtXQDXhOFez4o4RhB+APrEq1T7J0u0WWkhHO+q2hZQF1JR5Tk
	3KLPqU3kVMubf0I2BoxJzjpbQoTBWukhdInwYhCiBEg2T0acnJP5bMXY6RNAhQ
X-Received: by 2002:ac8:7f11:0:b0:52d:78c9:9377 with SMTP id d75a77b69052e-52fb9665892mr352804801cf.36.1788228193699;
        Mon, 31 Aug 2026 19:03:13 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5157sm97576386d6.24.2026.08.31.19.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:03:13 -0700 (PDT)
Message-ID: <50176d59-0f7e-4b38-8760-551eff80bb88@riscstar.com>
Date: Mon, 31 Aug 2026 21:03:09 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] of: address: kill of_node_is_pcie()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-pci@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-5-elder@riscstar.com>
 <20260901011827.730521F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901011827.730521F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Outdated comment in `of_bus_pci_match()` incorrectly claims a warning is issued.
> --
> 
> commit 0ffaade5a7eebd20cc4d79d7c8ed0d49f6da1857
> Author: Alex Elder <elder@riscstar.com>
> 
> of: address: kill of_node_is_pcie()
> 
> The of_bus->match function for the "PCI" bus type is fairly liberal
> in what it accepts as a PCI bus devicetree node.  If a node has no
> device_type property, it even allows a node named "pcie@" to be
> accepted as represnting a devicetree bus, though it issues a warning
> in that case.
> 
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 499d37ceae210..ee2eb44884d85 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
> 
> [ ... ]
> 
>> @@ -156,7 +146,7 @@ static int of_bus_pci_match(struct device_node *np)
>>   	 * "ht" is hypertransport
>>   	 *
>>   	 * If none of the device_type match, and that the node name is
>>   	 * "pcie", accept the device as PCI (with a warning).
>>   	 */
>>   	return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
>>   		of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
>> -		of_node_is_pcie(np);
>> +		of_node_name_eq(np, "pcie");
>>   }
> 
> [Severity: Low]
> Does the comment block above this return statement need to be updated?

Yes it does.  I will issue a v4 of the series with this correction
after others have had a chance for review.

					-Alex

> 
> Since the patch replaces the call to of_node_is_pcie() with a direct check
> of the node name to avoid duplicate warnings, the comment in of_bus_pci_match()
> claiming that it accepts the device "(with a warning)" seems to be a minor
> documentation regression.
> 
> Could we update the comment to reflect the new behavior?
> 

