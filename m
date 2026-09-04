Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498F481650
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529520; cv=none; b=GhWc1cFkvtkBYFAuhKZG51HOhYEYCZthl+PW1pDSzcdbxM96Loyed/+lm+p9RqHExJaTTJXyHgeCv+gI71wwP4EAGWtJGZvoLjmTnRNq+fhuPcmkiXsYc+ErEjpouSB1Ge4UJ0YMKuLqnYrIV9dN+HyTLwErKhG5q7jLcMJOv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529520; c=relaxed/simple;
	bh=AwKvfY0C3A+YddLSh+lZO9CKA3+wQcEcUbOlJU3gnz4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GbyaU3ByDZVZ1S8eDoBi3dZRfI69b5zgv5kyWZoggFrrK5X5YhWseSYQTr21gSehEIbfmkDTWEYi7Dsu2prZBTfFx0reiHLbNmE0ouSZhigY/3uQFpSRgqy+kswPW5sXQ8KJbRWZkRRCZxZd9klBGOk2MX+xfY0om8mDVndRbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RjlrXsbh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RjlrXsbh"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530420edf1bso17392391cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529518; x=1789134318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+308zQ7FQ1vvQnZ8ir3t08GSlPc01nU8aftORTt4WI=;
        b=RjlrXsbh1HgdbbM3kdRVnVshnBS9sDhQelstr1EWgMxTIgdIkP/nKe0ml5kSJwQY4U
         WoR4A7+xIPPZxLN6Dk7Lwofc8ZVkZxIDobrF4KPm0bqhrhw2F0qBpE5C5wCujWKQ5UwP
         EDGDuKkMvdBSwxVngVygBsEUrCMB91BG3/K8+8d0sHFmtkrYX/6xTxeWvWLbUSo8XZWI
         vR1mX9lqY4QR1biWTeWR/iOWAXOMCmLGHLb+aG4HSOiEC/aqjPzv5zt1cqxkIX0WuJHz
         pw4IPQjUWWmGFcvGUKml11jIqM6CBq2wkBF9b63hiZLIGitjFN3Gj7QZoD49lf7AwnZL
         VZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529518; x=1789134318;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+308zQ7FQ1vvQnZ8ir3t08GSlPc01nU8aftORTt4WI=;
        b=HAFzvYmhvmgppmyavdZLldb+rVnBbLj8uGwuoMYw2BGG9equL3CplO2pQ/eDvh1lAi
         dIT/PzY6zoY7uY1VHBD+FB6kmFdKXto2ZO9rFbcwVdByr2SB54/ezi7rMOalhqOS1oQq
         xCsG7EH+jKKbt3OSb6zHGFgRbpnjo4qHK9mdlYtqbphmGlsYY01ZIp6cmOOVY+gZLhcK
         4OzxWDcUPGRPZUcoQ/sWdNNJb8Pl0Xsc+D284SAHVMkrR/QIKtBF+HyIbI/HguI58d+4
         fJ/Rz74jupmhygoQ8tw3TQl+aCWEeSv8oocEBXfUMFmcvA4pvLyzw07V7GKPdFpoTCcf
         duhA==
X-Gm-Message-State: AFuF++ldGCEVsrOt75lGONKIfuimKyjH3N8mazTQce0760radTgL44OL
	26/r4RFReRXgAysdGASLVDRZVMZwSq22G9Jl6Ix6mtFneao8ggA06D+HsZN3CaczWGk=
X-Gm-Gg: AYBFou2Mypljx9EkhXhMQ2K06JEVXtclRLMFe2u2aGcJM4hqXAOv05cyAlCPCHB3oZt
	Ak2IRmq2UC4rmQqUiiKvGaYaWOc3HuSWDvUxzQBikzqcCXBDtgDPa9wDpPdmKWZ4926/3ZD1JmW
	0JO8GSIZtJeWwpZD6YnDhoPGgKIPN9vQK9It5lYkt6w8OCDoKouCeeecZlBt2Tpb1yyo4JVyRJF
	zG/uJwIcYvnQWOuxaMINuNH4v4RGJSVW6h8DBnSGfDAobN3dbhQQuHMS47iqYOTk0PyMg8yfcRL
	JCseu2e4ttHwZNj5LtuDnxG60Pqlq+tPlLEU29IuvybOLEgFk9MvZ2jIy6r4yJUgd7HGS22m3Xx
	1D4qZiOBJs3XQDc1kJECYwom5xx+FDvYQ6NTEcrx8V67AF6LEVqVGR/H6zHRz93O2wR7o67VrRp
	gCe+BFggOI1EV3trrcw/UDhZFnOBJXk3TucUgUvw+Y03N9WJUyO1OUI3l5mYMK
X-Received: by 2002:a05:622a:102:b0:530:42e4:f001 with SMTP id d75a77b69052e-530549b8baemr59653771cf.46.1788529517504;
        Fri, 04 Sep 2026 06:45:17 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054116c54sm20866381cf.5.2026.09.04.06.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:45:17 -0700 (PDT)
Message-ID: <453211e7-7ca4-424b-b1a4-745f0f8624dc@riscstar.com>
Date: Fri, 4 Sep 2026 08:45:16 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
From: Alex Elder <elder@riscstar.com>
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-4-elder@riscstar.com>
 <20260901012128.2AC6E1F000E9@smtp.kernel.org>
 <cde3da8f-933a-41ef-b7b8-f78317ca2d67@riscstar.com>
 <20260901173239.GD1244140-robh@kernel.org>
 <58452803-d22b-4e9a-8716-db46798d6403@riscstar.com>
Content-Language: en-US
In-Reply-To: <58452803-d22b-4e9a-8716-db46798d6403@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/2/26 7:54 AM, Alex Elder wrote:
>>> I would love to get some pointers from others on how to
>>> do this correctly, but in any case I'll do a little more
>>> research on this before I post version 4.
>>
>> I'm willing to wait and see if anyone cares about cardbus. I doubt it.
>> Maybe there's some old PowerBooks with cardbus?
> 
> I'll give it another few days before posting v4.
> 
>> "pciex" should probably be handled.
> 
> I'll add that.  I'll also try to find what the range
> of "compliant" device types is; I presume it's in the
> devicetree spec.

I'm about to send v4 of this series.  Here is some information on
this suggestion:
- "cardbus" is referenced in two places (two very similar functions,
   one for PowerPC and one for SPARC.
     of_create_pci_dev() in "arch/powerpc/kernel/pci_of_scan.c"
     of_create_pci_dev() in "arch/sparc/kernel/pci.c"
   Based on the tone of your earlier comment, I'll ignore "cardbus".
- "pciex" is checked in 6 places, one of which is generic (the other
   five are related to the above two architectures).  The generic
   one is in of_bus_pci_match(), mentioned earlier.

Sashiko's suggestion only mentioned those two device_type values.
I'll just add a test for "pciex" as you suggested.

Herve, I will retain your "reviewed-by" tag; if you disagree with
this minor change say so and I'll remove it in v5.

					-Alex


