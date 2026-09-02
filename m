Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A4493649
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353656; cv=none; b=VxFWXSXczv6c38SC1z99a/kZbN3/i9NnVd5ohfLt/QwJfDw1SA3E8fTa2ZEsvbXD8Dc6C05+KU87xlzUFE/u4MZeJLsmofNT/DutuwrstEVIH+MxdDjSvS0tJQdp1tU4GPGoO/G1H3OLd8ovg74CxVEMumDeT8PSknlnT6eeHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353656; c=relaxed/simple;
	bh=cfHF43Ine7qBJQ4yGW2dx3QI/BoEj5Uk/rG08tzXK7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVBWmsunXvTRmMr2dwGe+lovvsn/mkQr4XIIyBftnjOQDgPtu91bWShZdvtOjNFp1OO8a7YDLIAM3jIFeG4S5nnZZY31ICPU9yjkYlYsdXP6v5jVext6YFNzOA0ns4Wd/Ovn+Kyf6pO1yzKWijEq2dtImH1e2ZtZK9wgTVEk5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yhxOZFx2; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yhxOZFx2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed3993c1eso67917285a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788353654; x=1788958454; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b2V5MXPsa5bsC9pz5bMRlVxqIlX3QBRBOS64r/eMF4=;
        b=yhxOZFx2Zl+7fIDIaGfd+CqDpz/RG1PAwdUJyBh/F5etbD7TxVJaz0UjB87AxlIxUS
         mU2qyw3ablKMizIuX4blslYV+CUvYJmBjJJQmVDf40OqrZq+fMARdt+sXI+HH87eHaRm
         CcjrKFj/PSUodzajvIqhvZpkIPvdJA3CTENMZsDGp+DCxJOuIrF0/D7X5NiVJeGrp73C
         2GyVDk6V1r5RrSVl3GoFE45zc2zrJlmhD/W/8UsUThWIsN0+xMAU+6YjQTTtNXKvRk4s
         CW4fo+6G+/JNe5xdhc7QpAGZGm1mxzrrvyv9uYXxOOSCxlNV43RW9fechZvxvTX9FZlv
         W17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353654; x=1788958454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b2V5MXPsa5bsC9pz5bMRlVxqIlX3QBRBOS64r/eMF4=;
        b=s+UpFVKoxTPeql9kI5On1n2KJ+mXm2rK79SOmuzuFm6UkL+FexwjAKLdtKXIazcHQA
         vJUxpGNNLlZua/0RPh8uGMIbqqP/WbK/drDXELQaavcLOUOmWOHIKtwEfTqi57rxlnQi
         DCVpITAhiQUzwzIerhLETWHbpb6kiQen9c0E8nXF4yCgfReiGqd8LLBB3/LRW9azisdC
         kAkygFgSGxyThCn/IYCy0blWoNd8un3HMLb28/kPhyb4kkRSL/EEEVd7/+oiLlZJcF8I
         +72NjJ/UEqaXY1hSmikwZ3ilDU0dcV/G+CNHQLza61Gfi/MB7sGreJ4oAdyn12Wgfg/A
         /g2w==
X-Gm-Message-State: AFuF++nDm3gZfvsG1SAZqP/nylaEAoPRvwPQXRy47ND4GuAcKpqI6w9O
	Kse6b+Xee9NiGpoHWnt6OXrnWyP8mSxpzZOyCrCK5Mk9BgvhiDW9EKjZl5PnmD3lFlI=
X-Gm-Gg: AR+sD1360V2FKESuwbKI1uOxoNCBxwP9aj8qpJpCBbW7IhylcrAmHkUirBwnmWDkas+
	cZM5k/TE7/ho7+nYNJq/ZfJjktYCi/CgX4Aeb6itoG8Dpjf97l+DA5lQqQH6YlTOOxFdjFw0cd/
	jkI36AQsEGgF7qRUxC3zC/YNpF4O+kVrSesJCIlFxf+H9JaXW3YL4hp9oZxQ9Pxhdf4ozvgYv7k
	rl5itnB3IdOeZEKbKMiWnPRxrxtWLF+Ng5EWN/DGwAMi6LAqZlgTs/X/TbGNkbAUEsilRhZWNm2
	xxrSpu+maDlANSlkES1y5FzO5K1ZPJDcnEvc/nPOmgPRgfYqU0EFcXnJ0J5iNqXCJ5POsBEE7u/
	jNcBIQ51AtmsrfOUxYWrO5juUVceyX+IFVQkvLfJ8OTFs28eGXP5uF2nhB3Lw7mlPZIkJg7iP+9
	cxUmEeXBNdVey4yXZ5IzX0WFLkZsvy+3JiubTEpsvOp/vNkbegVsqn35IYRz0N
X-Received: by 2002:a05:620a:371c:b0:937:6772:d8d with SMTP id af79cd13be357-93960f1811emr528224985a.20.1788353653772;
        Wed, 02 Sep 2026 05:54:13 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f359ffbsm196501485a.28.2026.09.02.05.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:54:13 -0700 (PDT)
Message-ID: <58452803-d22b-4e9a-8716-db46798d6403@riscstar.com>
Date: Wed, 2 Sep 2026 07:54:12 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-4-elder@riscstar.com>
 <20260901012128.2AC6E1F000E9@smtp.kernel.org>
 <cde3da8f-933a-41ef-b7b8-f78317ca2d67@riscstar.com>
 <20260901173239.GD1244140-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901173239.GD1244140-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:32 PM, Rob Herring wrote:
> On Mon, Aug 31, 2026 at 09:42:46PM -0500, Alex Elder wrote:
>> On 8/31/26 8:21 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] The check in of_pci_verify_node() falsely flags compliant CardBus and PowerPC PCIe bridges as having an invalid device_type.
>>
>> I was unfortunately not considering those types of bridges,
>> and don't have experience with (or access to) either.
>>
>> In the devicetree code, of_bus_pci_match() does check for
>> device_type "pciex" but does not handle "cardbus" (at least,
>> not explicitly--the "default-flags" bus type might do the
>> right thing).
>>
>> I would love to get some pointers from others on how to
>> do this correctly, but in any case I'll do a little more
>> research on this before I post version 4.
> 
> I'm willing to wait and see if anyone cares about cardbus. I doubt it.
> Maybe there's some old PowerBooks with cardbus?

I'll give it another few days before posting v4.

> "pciex" should probably be handled.

I'll add that.  I'll also try to find what the range
of "compliant" device types is; I presume it's in the
devicetree spec.

Thanks a lot.

					-Alex>
> Rob

