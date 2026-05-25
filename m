Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC719F12D
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714407; cv=none; b=YdhTVP8LNpz43kza7lyyLEjuHKlQf17qIvXk3E5ztgYEj2GL/G1dSX/My/9dzzPOb73OFibMvioj+LuKxetJzrN1ceS97eyLag2+YefdUdvkeEskYLsAA/LhanWMyhoL2NDeV+6EHBwQdqPXaNRwVnYxcEvlbVJ2ClyRkInc1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714407; c=relaxed/simple;
	bh=H2MbsPdJu3INCwzshjzohU01IaykhjDPO9vTUKTefd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDnSmd5MCE55l8oXi1Exwou5n1k6OPcfMdesaIUjNG8oyAYZla8+9DH8nbjCJw/7Du0TEWcPmFpLLo6TRoIM4+SuEldKUauvgY3ZmpGoDZdUA2hAHotrUKsDskBccjSAxn1w5OJxy9gffRRT6ruSEBK86FksU23uS9vgedt60pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvYx0pIS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvYx0pIS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041e84237so25533225e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779714404; x=1780319204; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NsFAHbbgOzCLPcPVPAC9RtB2/tgqNqDMLkDlsW/0Z8=;
        b=RvYx0pISRKkPIInOQqs4T17PydXVtiwaX/zSCYFrwZjoXXzGnPBd5SpeSybOfVZPeW
         H4J+qtL62Vfy2cyznccEfl8On33DdfXZcxA3+A40E6sLnZLq1FTP1dewXn6RvO7dayGs
         AVwweZTUIdhAalFQqnyzpIYJ0+ao2xr15p2w73XIh/u2KQykDr8k0KsjZ7YSVpWeB4Wg
         hIiJWhtTb9hpUSaYcb3JDmMlMs5u9t+ebACvWz5Za4nH/7CCCJ7aDckCgFyaZ+urQ0I7
         Ij7NMFvumZ1PK/ORsNUNyA0PnTpgXXnL6B62/IRpr0N+eZQ1QDCUlFynMLYiGZain6Kh
         rPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714404; x=1780319204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NsFAHbbgOzCLPcPVPAC9RtB2/tgqNqDMLkDlsW/0Z8=;
        b=Z7ZypYfjyzfumDOldSUaxEVjlm877PmyfhFvS2qZCZBIbFSnhlDN4LmPTSwUUgmg5n
         arGienkHpxnz1pwtYIKU5x/IfJRZBl5uvOcOKoBG9Tek/8AtLarI5B12HFt5FfKg2iJA
         8CzhK7pj7YmqN9dju8Hl2CudggPjr+bRYn76fbtrWTneGXhT+H8EM7LIsvGTnsC2BjIL
         OtmA3wqrgswM6H4KNFEKS0Rtvb5fv2IiJbt3wTJyupvxe7p6WuRypvIslyIDdHIj+XTy
         r+iJbC41xKvzW+D9+Ggv9cK4ftJhhWLeXUSEJt1xM9QgJOU1YTw5eyrsEaj1ZL2Zlwlk
         jNxg==
X-Gm-Message-State: AOJu0YymGvluvbgHKFyq+UxXGhBZ++c+lwfGKNblMShaG4o9ygZvGBUy
	DP4L8AdZmxXAdBTpmCsuYsjUq/IPPcYCIxSYoAIeP1NtujWqBVFKSuNMtwR+aAsX96Uh4avMHTR
	2e+v5AfTHvg==
X-Gm-Gg: Acq92OHbgU0MFbCJ6Hvx9kWCiETQGQ9pAxNMoUHn64C4KFybR3nUi5UGR0BALK6+Bg9
	P8oTXkanK97NK8yWUdOv9uIQMn4Vwj6EB7kq7kL/3n3rLe/G/8astQCmn6w/R7gJx6hkho9QTG/
	iEBit2fXxLKiIiJrpMq29rwiU70LZTlN+y3gaQMeXbRsPiQOwarbqtGz6T1KrVlLM/bVSLIAtzg
	8+l6mMxcvsOKQURe7qo+ptMVz4QPGP+tFOWyXV5u5dlmc88GAUFvno3qLup+tzEYFm4LqsqUuJ0
	vJgrw9AUVSbNeLEZ/5QKe1KrthMOvOGtH9/6RFjdjSjtSKF/m27D4SMyiXJKbjEwLQxBx93hlXH
	ajyDap3BDlWBrJs4QEmOSEZsHFPZLh6gDEE67gX82U91wzUZHYOimYahVbmMJH1Gc2Bf7leo0o1
	33A4xxIz/1VgzzXGhFXdLWEuEnwu/Jvvis8NcbHooibg==
X-Received: by 2002:a05:600c:2a8b:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-4904226d9camr124435635e9.5.1779714404415;
        Mon, 25 May 2026 06:06:44 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ec538sm84251795e9.23.2026.05.25.06.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:06:44 -0700 (PDT)
Message-ID: <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
Date: Mon, 25 May 2026 16:06:40 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260525125455.AF31A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Not sure if I shall reply to this, but giving it a try.

On 5/25/26 3:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `samsung,acpm-ipc` property is missing from the `required` list despite being functionally mandatory for device operation.
> --
> 
> commit f4129715b1366153f8c291ba713ab0836fdf5768
> Author: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> dt-bindings: thermal: Add Google GS101 TMU
> 
> Document the Thermal Management Unit found on the Google GS101 SoC.
> This hardware uses a hybrid control model where the Application Processor
> delegates high-level functional tasks to the ACPM firmware via IPC.
> 
>> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> 
> [ ... ]
> 
>> +  samsung,acpm-ipc:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the ACPM IPC node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#thermal-sensor-cells"
> 
> [Severity: Medium]
> Since the commit message and binding description indicate that the
> Application Processor relies entirely on the ACPM firmware for all
> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
> required list?
> 

I disagree. The property remains optional because the ACPM firmware
can be bypassed entirely. The TMU IP is capable of handling thermal
management directly without IPC intervention, so the phandle is not
a strict hardware requirement.

Cheers,
ta
