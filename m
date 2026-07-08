Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6DF420868
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469789; cv=none; b=gKmhzIWVltH2z6hVyBrG3LSBN5NPuMn/onHRoeMzPAfNleMX28Yo4N98twtR4fIWrw+6lto13efmXJO0rYRJtKa2wQM2wmtFO1q7emM34YD9iwp8vQcm5cg7x5UMJjGWltN0lUmDF2cSeKYGlxlgeBO8s9AQXigime+iEXOd/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469789; c=relaxed/simple;
	bh=+IxhJHxFXE6at0Deeog7yecfD2Aqe4PUDDvFgfAOp/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYpzKmB9pScFs7cEf8DV2HgZ5YjramdAiNMLj7Ay9B6wjpSus2CGhV5LfvYgRhSIVZ8+DwbFss/m4IUpxlGvZnlrJI65S0YuW2un0jD9l5TxTTv+2a9IiH38NKPYaZBHhiy/19q5buycnxtFVtgTmTQUhMKiL9dDLlDk08TSBEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWdJgliR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWdJgliR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4728c12ba97so58215f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469787; x=1784074587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GThHvAe0hdwvlCEgL70hqx2pL+WPU/NSDc7oJChD5/k=;
        b=TWdJgliRsvIc0zb06FqMSXUCYA+3FsmPsjyMJvIxI2RQVthG9W/vixZ4GCH1ql2w/R
         eO7+OhzXR65nKQZAH6FfhmZTJmwc1rmj8KiokJ6bPj9ppyBgowAKXWe/AinatFkBRyRY
         4KmyOiI4mSlB0GgrPVsxtIWL9ggdTe8dcnqueqk5QbdLSSqBh+dSuqiDJlvvlBT8OBUe
         Q3hDyCJBGNqnIQdjd7aejE6SIf2NV1yMNATo8n+Ux+TdHrrowFXl461Vsq5jYxblQY5j
         Q/kPAg/qmCcEFmpmAUHpFMk4AFa9L66sGh7SrQEIuEICCE8gqvZy7IJwevEOXnlmHvK0
         Q76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469787; x=1784074587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GThHvAe0hdwvlCEgL70hqx2pL+WPU/NSDc7oJChD5/k=;
        b=YygHjlBGKjuY+BqR4vkCXh+Idf4WU0LYWV1w91fbeSJ1bShTsQfr+RpcESC4yDXm05
         qmnZBxePwWkvmSIF7JHad2BdE8Te5BmbuQ74Er2BlOGWy6O4b22m5tHcms8vcvCgh5ba
         959dmmJPyxlWzhLoYlUkWaAEg3FPPnouOusCy+NjfUz4AeIVTUn0Hzr0S6asnwUwbIMc
         HX18UpiqMm9OakzvHMFIxtdGKYfitMDLUAT2cq7a20bk01cPtCIdv9bjDS2Kuu0WerYW
         TeCGgwyYMD4dkK0/bDZhq1pjBv+9xEewPhUBNSIpB1KpX0b0Btx11ZWjhBQCfWoBZI/k
         7Wdw==
X-Gm-Message-State: AOJu0Yy61iJeGFI48XG9+kpUhagIj7Leqiavvm1G0EJyj1/vrA/2nM5v
	YN3+5r/Y6BOMOJy5Gla/0GAv3GeD2FnqNkiC8Y/BJIBMvbPuRDSG0pMn0qjgDg9pAas0i5obbOn
	3QUXVzGg=
X-Gm-Gg: AfdE7clV9st1cs4WEY25Y+GXSt9aMIVdV6mgT/l3To/6t17kl8tZYx2MjsEjIbdP381
	U2djqtUQPjoOzKmgJ6OXokuFZhYUvinKTiACOgdGCupodYoK9EOMKgBPAaUwL5XbzPzzUmH/cGm
	6pZ/eS4zZj4suQ4tLWv2CmMC7F3sIkesLDQzZ8DTMvCOhFwT77b0r7RmwwSU9rPA8ENZTtxpTSE
	6TShn2sQASM/55cqLmJ9XxEIEzZHv43gs5aW+Jmg13yLdbzXhM0xNX5oeQY96+QfBvvyGW1Fgle
	4p/6v+ujf1KQqpXf2iW6XYXf+h+Dm3/nicr4y5Oh9lBDXcKDfsRjfXPiCmkBQV7pXymtqwwPzqN
	QrncJ6nbK2BOfRDQ0R4t+vUdod2v0pOTEhHiqjZ1LaAhxqyCsd7eIOVCW40DKBH7Gm0/MPYAeBK
	P0+BeUvG/TSMWQ2xQFJen2Gaw=
X-Received: by 2002:a5d:56c2:0:b0:470:80f7:9ef with SMTP id ffacd0b85a97d-47de667f8cdmr6466930f8f.19.1783469786684;
        Tue, 07 Jul 2026 17:16:26 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm36974417f8f.12.2026.07.07.17.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 17:16:26 -0700 (PDT)
Message-ID: <dfb874e9-8367-4a63-89d8-5ca6e7ebec38@linaro.org>
Date: Wed, 8 Jul 2026 01:16:24 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
 <20260708001445.B4E5E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260708001445.B4E5E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2026 01:14, sashiko-bot@kernel.org wrote:
> };
> 
> Will this cause SM6350 to incorrectly fall into the non-legacy path when
> the PHY bringup logic is updated to rely on this flag?

Yes. I missed this one.

I will fix this on application.

---
bod
