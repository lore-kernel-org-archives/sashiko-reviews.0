Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC163C3F7D
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476563; cv=none; b=F/WGD6AW/qolHKQubdpnK/Yz2vRsnxKTxJaCw+zk/tyckgcDzzo86ik8C/63oy5mvRRriDaofhC8qC+1fp+UkS9ImIyQ09fbx0XxI6e564CuIqdWqcAxU4MBxI9zNxadBhrg4tnxjMWiK7T3IuRvJyNIvZAy+tXc/vP1Iv3zAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476563; c=relaxed/simple;
	bh=1CfyMB2h1Lp5gQE5pFkDas8JqDgo931tl90o9e2+poE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYAYzncyDjevQnjBzprrt6nusRHm5XZpFjvGaeBJtUhIV3CO9xc/R85TvDY01k2scUrVExqsEtai7oxpo5YhbgpoU/B8QoCjratOqrTd/E7KxTy/Qq0HBzWHiqoOS94cuGONqj+yKOgBWi2rEgnQqzK0gn7aFZMAlkbwkLl+YbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jdexW850; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jdexW850"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939695b5741so367162085a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789476560; x=1790081360; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLVX/S0EuVLiFJIa1AXRvkqCpIEN2ZZSYIPfhR/fxMg=;
        b=jdexW850Txjb4QVpXGlxawp9XeISWykyenqQdhaCq65zgHMIXg0jYW4Oha4M5Grtqy
         4lb8aygsDlc2hOYrJL5V7p+TAtojUBoN7sB+uSQGws00vtG2MaLYE653hJDH7T3HRQxB
         jaPCUt5jRtuUBdW605nzxqoSYSTm064cwfaRsw7dEbiyrri7hIA6D/aZHeFJyiettsYn
         EVVJ03Lv1AoWtk4/U/NLHmrzsYkZxDwEWLjJSNEVWkrVrLcnOBPsYHzO7L0URL6mzPp0
         MghkIG1jDlSDlWSlep9F5H/aORpUCMk35iTZi1zQm1teB3AoQ4P9d3Eunup97M1b+Pq9
         /cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476560; x=1790081360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLVX/S0EuVLiFJIa1AXRvkqCpIEN2ZZSYIPfhR/fxMg=;
        b=eVErNzSqc0fQ+/88NB+ZByGP98+L9nhccXX1tCAFP6l08ECaNcQ6hGDrX8z6ReximO
         ARN+UxQ0MWhtd2WY2+9n5178HW62Hb+RL1XVkzJEJ/Y1LVcOiGVhxOANTkUbRtpjkY6K
         /gNPwlY3PU6v0xfafKxzypK/O3akhFaVB3+PvccTZ3mciywCVPcap6lCzCPNRi4oQodJ
         IBripbFF4shhzUEMqFGc8qhxxEtTQY9WFE9lap0056Bv3lPhwXqT3qyBRgHYZyoG34Ja
         2sH+1NouTqBittbSQUHj9yf+FsQ+K/qsNOBA3aFztp06gM/rOfwlSWp72ZjvPmV7fPvl
         cfsg==
X-Gm-Message-State: AFuF++no+CoL5pZnNYzXwhTTalRdzeaT5p91Wk3k+7No7dRc7KxKG4kD
	i6effH2kjfFkdCtWwgf5TSBIJ65aon0Zu69OcZqailDMNpU44bB4XZm8jOAbE0JDUztZgqTIwRN
	U7CeJ26o=
X-Gm-Gg: AYBFou3PIiCAxFXcW+fxlQ3Z/InN4ZR6CI2sdQZ81zaTiKjvxIiRJW+KYALyguu/cUJ
	PY2d/zkuyLbUTKUuaFeUCq3aCvUk7N7Vtca90I5EUxbFoxKjcp2gAMFaHdNy2YwS9DOAjbcvcEE
	wHUpWJMEhuIsZh8YTKmNhKwNQ3tlPixCHlYoxEnKrDy32EfFinhG/4Erld8HrfhZst7Au0K5VgX
	V3FR2++BfeZNUre5aUDRFQrzoJ2vbWJ+5Q14oLYZ56wdqLBKU0J5sadNRznuR7Yuxib7EEe1KLv
	tiTI66GZm5qNaFkcyP3Oz+ET5aZ26MwuFgMzQqtO4ttPB2L93Q25bngnYnHZfcqV7MWLonkRTiA
	PATYMY2Vmn0/CfBQKP/ja7vR7ZpNHyDtAUTzGLibo07DGeSvj3eBIzwOwAu6WQx/On1vLuqkgZ/
	33OqeKEtmlzeoPOhsEJVM3oHDvsMgMbEyDskAT2ZbnLwFJ5AEnUvYRChtvKnIFdVR5HmnQ0cY=
X-Received: by 2002:a05:620a:43a2:b0:939:eb65:bd38 with SMTP id af79cd13be357-93a29a820aemr1092541685a.35.1789476560394;
        Tue, 15 Sep 2026 05:49:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a382ab7b3sm169560185a.19.2026.09.15.05.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:20 -0700 (PDT)
Message-ID: <7de28ce3-fb1c-44cc-96d4-47d21f6a05aa@riscstar.com>
Date: Tue, 15 Sep 2026 07:49:19 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: misc: introduce pci1179,0220.yaml
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260915031038.1087264-1-elder@riscstar.com>
 <20260915031038.1087264-2-elder@riscstar.com>
 <20260915031552.179121F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915031552.179121F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 10:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: typo in compatible comment (TC9654 vs TC9564)
> --
> 
> commit 8118db85b05b7b5ac32fd5abc0d4c0b807fa8de2
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: misc: introduce pci1179,0220.yaml
> 
> This commit introduces a new devicetree binding for the Toshiba TC9564
> internal PCI endpoint function device. It uses the pci-ep-bus model to
> represent sub-devices accessed via the function's BARs.
> 
>> diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>> new file mode 100644
>> index 0000000000000..fca3d331097de
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - $ref: /schemas/pci/pci-ep-bus.yaml
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1179,0220         # Toshiba TC9654 (a.k.a. Qualcomm QPS615)
> 
> [Severity: Low]
> Is TC9654 a typo in this properties.compatible comment? The device is
> referred to as TC9564 in the commit message, the file title, and the
> MAINTAINERS file.

Again!  I fixed the previous typo with a new one.

If no one else offers any review comments this morning, I
will send out version 3 this afternoon, fixing this and a
few other things reported.

					-Alex
