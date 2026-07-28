Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130641D625
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233166; cv=none; b=GXty1t2vVhJM+3jFjUhBrLBSfCNIGwQtNPo5/kaZ39ReD4A6QzpN8Qp1UO/4apObBo0KozuOGsFynDGWKymVAnRQOAaZIMWTOxkqzYayJi3YgY2L3vLw/BCiNYth6J02wBFa7fEAn/d+MKxfGLit94MfLiKJQBpuTtL1T3qFxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233166; c=relaxed/simple;
	bh=Rp6+uTMCabzqwWh7spwIBUTlBYjHvNxnWsIheA7Ukxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmezek1uAJ9m2JBzB0xJkozhGm8Ir6vbA/thEdFWK+phyjLCSF/YhGpm4ko3dGod5Uqv0RfAxEHGZpz9/U8DOjh0w3F8G0bl1amQCW+yEuby/02SlZy0AkhTfI3qjjX8U1HaWumc6kTbsrUM0HIxGaUoWR8adApy9ixTVE8+Tz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFToWEnD; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFToWEnD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so465424866b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785233163; x=1785837963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YUhY2kLHKMkStru04ihqtiLZEbioAB+gFNR7L1P5RY=;
        b=uFToWEnDuFoMR6vE2rRSSweS/l6bfVq+I4SKYsW93xyyD6zFdLxVCWRhbZuM1zYDFF
         RvS1en9ML7Z7JVUNhhFL5mVpyHNx97JDaZwOjynKO07vmr8Vb9TKZtqfehaS9b2kd7z9
         EdzlGIVhzwPyG9r8DdhPA+ziqiPguW5KubhGOO2KePp0sm58bhKuNstZRcVF4JF1Cxk3
         5aQ11lrVPFY/gzn7QzeEqJwnvv6irfqZTRZbxD5Pp0/XooIdBZ+s2yONAU+HZIl8dPQL
         XtkSfcPc30/V3XV5sa5ZZ7XupvTzERI3DH1VJlmZM+Z5YLpM/XZ66aYm4/rnKuzBQ2EC
         NjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233163; x=1785837963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YUhY2kLHKMkStru04ihqtiLZEbioAB+gFNR7L1P5RY=;
        b=rueMgynb33JSgeSS+q+zmE6s+uYuIWsgPD/gkAMRv9DnayLom0Yv/LMnC5IdSt3rhW
         gyC4joXIMnRuNdRgl6F3AnH1QlXlDg6k3LBRYCLpqS9+/34fZsQafIg/BUWNEpa1N4fF
         xeKeLVqOczPax0hbxmOjRtkpMCSpoXhFTek/JaAcXRVzIqQBCMdCjEncwjQwg0HzA9ic
         AaMArf7lAfDrCE3CO6nX17WHLYgCjoRQ0lfBIPqUcmRX6jYvXMb6RA01UUB15gmegrY3
         A6PhIVS2MtB5MRwbPnsMqbsR80rkj2QTMSZ1wKvqhfTayMdVa+2zSGMhTwjyoGJ/LnKl
         uUdQ==
X-Gm-Message-State: AOJu0YwVbur8adopQp+fFDATR5m9avfSGasRuy/hjk/FwCYpmBwUjBeQ
	C2XMfUwa40FmVYAVMRIhGjeoWHFCoSX9kxRUuXDrMvwxGt7GcZZTPmpUu+M/G5fivyTJ9DN/0IT
	2Gn0lxmY=
X-Gm-Gg: AR+sD117yF6oNUUIRFc7OMq15tud/bNWhH72uMkMaumJdoa2T37XLLgPAc0mGZsJIC5
	92gRRk/sgHeY7r40xyX8BFaQtFkchhlBwpRMN3YrLn74jPzSX/Ud4SzATqkGw0B0Yc0Dqun7V5B
	qferiiXP6QkJNbS6bJ0+74PEN8p8hCW/h9Q02N2Bk0N3RrlXx7RiEeitxKIom+JqDdtQHoGXtmY
	RGshUFzeLHeX+39aBRNSLDPhQUPQWWE4vRY17UtGRDTwo/UOIO56rKU2WzEAeHTh81Bap5uHKT8
	7DSl49vwidukfmGX/Bo3A7CFvDSIBN9DFRBgw+V/T+7Q9yHlDtDvbwYoAXsRIGSMfYpIhkkXSeu
	/bVjGaoLLRHI+YQ3f4dFOSk1J0sLuhQ3adtlzoTU7KaBYncWtONaAknp3ETIxYG+PpsFSxu5Fcz
	QdbXS+AnWkCD7m7A==
X-Received: by 2002:a17:906:fe4e:b0:c16:677b:4d1f with SMTP id a640c23a62f3a-c1f72489d85mr86000166b.54.1785233162679;
        Tue, 28 Jul 2026 03:06:02 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm725854666b.21.2026.07.28.03.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:06:02 -0700 (PDT)
Message-ID: <a9eb7475-2682-4b9a-b401-6178282d34aa@linaro.org>
Date: Tue, 28 Jul 2026 11:06:01 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, robh@kernel.org,
 devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
 <20260728094212.0F6511F000E9@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094212.0F6511F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:42, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Since the CSIPHY nodes are being moved out to peer nodes, do other properties
> in this schema also need to be updated to prevent validation regressions?
> 
> For example, the reg-names, clock-names, and interrupt-names in this schema
> are currently defined as strict, fixed-order arrays that expect csiphy elements
> at specific indices. If those elements are removed from the CAMSS node to avoid
> resource conflicts, won't the remaining elements shift and cause
> dt_binding_check to fail?
> 
> Additionally, the ports schema mandates data-lanes on the CAMSS endpoints.
> Is this requirement still correct for internal links between the CAMSS core
> and a peer PHY, rather than physical lanes to the sensor?

A good guess but, no - illustrative of how LLMs "understand" stuff but 
actually don't understand stuff.

If the graph lookup and probe succeeds then the legacy regs/clocks are 
never mapped by camss - if that lookup _fails_ then you absolutely need 
the legacy stuff.

"Dr Chandra will I dream" ?

"I don't know"

---
bod
