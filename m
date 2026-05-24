Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B229443
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637049; cv=none; b=kWA3XQ8plj817eaUNJJr8GxrghjFpqMPOEs0wE7yx3Yns9o4Ynb16FEyblXHIqiTlvtUBetNeIXuljLX3gebBQOe1Y6nSn5LYI4iy4JgZlaHdXKU7Llfm1oXh/TPO30vVMjFnRMPXV4FgiOC1WsPDcOmJcFupot8hdvlXII9IhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637049; c=relaxed/simple;
	bh=yM51uPAWbCZkgTKU43lQPRqsYdSsABpsKVsRDiRWNaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYUD4ql+IzdhlGT7JGhQn8ogBlcj+Bwe+/0BKmVJ5Kgyyzq4Q0o79SOXo8y1qvzw0NBm3GnUITIm6SPeTFaL8ta1U3c5b3CswtcGmXMgDsGOhaHlkeCiKuVSbuNhxHV7ww65iD8LQFWJChFmVwb21anLfmo19FLSFm3/wlzflRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qfWVSOFZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfWVSOFZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49041e84237so19340605e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779637046; x=1780241846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9w10kDWoHcF1zCIEhfuXbWfL8gd+AUbKivXCljEU78=;
        b=qfWVSOFZ/gU+McIfxK16raC+wcXFgyt5rfbAgblNIgLJ7+enrqNjo83pwIYmlPsFsF
         2j/S/WMlLlemjZv68tYjNt9Osl9L021s5/ubV0nLDuBT2YtFcH3RadSJ3m6JVmq1hov4
         mm4pSdsNoq2k1c7XI1AiKQQU5r+57vLisA62tZqh3sFGL6JagbRHHkIhBbQzpc+NAmxR
         lQRYCEf38U/Gi0bM7hTG3DwaFPAfKaEVo4tet5Hqal/6OIq5RH94jCc9RqdgRidNtCuY
         TXfD2PiUfRRAUBG9+vgO98s8y999oB865n+yA6TmrR4WbO+YnTMKQ5CzKIaMAdzUu5Cr
         8x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637046; x=1780241846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9w10kDWoHcF1zCIEhfuXbWfL8gd+AUbKivXCljEU78=;
        b=YCarx/amY21i7rGQ3dzcRnB03R92on++KO9uag6dQek+Twf/KA0MWdHfjrYUDl06ld
         2nDUMvZ7M4LCJ3v5lt5pcA3LEg7GiognKEvQjq0Ug9XfWOi8QC3S58Jhnp9u/fhT8DhC
         HKibMlXAVStqSUxxm92ergd9PsWcnJLt5TIqIqYPvgytacS5Duf3t5CUMRCJdb8C2SsJ
         UbbwqwS4/eAhdgqOHc1Yr1U5g7MxeYM0gTzFHYRx1SUwjv1zNqvbbPrFVcsm66/PXBOk
         iqbRuaCJ8TWPM2CO9NR4Hu5LjUtb+KzaCkWSr+9klDWkIpj3ZTI6Z+Ew/ZWpGgbRctad
         BDHQ==
X-Gm-Message-State: AOJu0YwHx8u1IVR89DTQoxrr2RdvcWmsVCzfc2tCPUYGhoeD0nkgbklK
	EqyMOyT28gVli5dOWt95LSgFz6q0BGNykWgfeMXDbV3xUB/3PF5Txr6J8hSQxhSUNh2RgUpCKzs
	r47VE4UY=
X-Gm-Gg: Acq92OEP7gigYWS08hftxwmQQWBsJuTNCFZlF85pmbmneApM8BbIQ+0HZmHuwIOEqTD
	jM/NqrIuAYcE7u3XDUMu6tLI1CJwxN0f69h7pEkar0SKnl4CyU3xw90FCFoYhZVbgVFEyS2URqw
	7xHjBP6TAQwt6CWyJt8O3pRRT3/bwJJBhfalc9U0CxRoPwpWZJNl8pKVzNc0JMouGtql1Mq0DPh
	u0XkaTSE7rmidjfWCNmRTZFSuu44FX82q3GrTMyZiGjLBq8PKg+dWTO6zqZLtCIP++skXb0R0yy
	d2gdE7G0sOVZoPv5dOqgqb+44uAAotRvfHS6+sUNXZJccV7NiBc12m6eUxVMjaN6RTfJIPjxOco
	ZCiX3rtk419Blkvf3n9S7CBXuFNtn42hV9i7vr/KT/75HmIg5d17auKAHKRBJuFLW34ivGRoisX
	WlN7aqRsfNtx7DqeEgGTIcOmMmBXJeeh8WbKiqno+3ujWDYgQtaPLCWuo9POq8zOdrINIRvOpBo
	8KlHBpr
X-Received: by 2002:a05:600c:4506:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-49038381676mr217241985e9.13.1779637046483;
        Sun, 24 May 2026 08:37:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:8ee:8600:662f:d52b:3b78:6113? ([2a01:cb1d:8ee:8600:662f:d52b:3b78:6113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d493dfsm20504579f8f.23.2026.05.24.08.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 08:37:25 -0700 (PDT)
Message-ID: <6c8a3b03-457a-40e6-bd2e-d0e5f2766ae8@linaro.org>
Date: Sun, 24 May 2026 16:37:25 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org
References: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <20260523030420.045501F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260523030420.045501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2026 04:04, sashiko-bot@kernel.org wrote:
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
> [Severity: Low]
> Does this property name mismatch the actual hardware supply voltage for the
> x1e80100 platform?

Yes and I'm realising I forgot to make some small changes Krzysztof left 
@v3.

----
bod
