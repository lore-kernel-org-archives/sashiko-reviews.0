Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB73377553
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348097; cv=none; b=QxdPKU9+cPDUNgEGWSJUSomEAUwLrcINhGgzd3KmOWYzn3KjEtBGkxlRRPdbOXxk4jfUTQCHaURe3gyGQ7Qclnv2WzigRQFVtpu0uuBWyQTMwsmbNQY0bj0S+e/74+0C/vHx4EV1LJ9mKNnLvAtNQaJ0Df5r8fCOJJKULJAH6w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348097; c=relaxed/simple;
	bh=9frbej+PZWy/5AMY8IKoA395BYnUAbevTmO3n7s+E5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+I8JydH9AlmuPSk5xJIlpPGigIRZnADhjmVJ/4GNQeJjbwTSHW0QdKeFSs3wFXfp8YtOHISbPvFhBwEDbG2E9DVLCRxZ/66drubgTiFbOapy09/uDeQnbFaYGsZ6JXe+JGdiNlY7H32WFepADTM6usgzV+5YfMP1xAj0VtkKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Ej2nSQsb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Ej2nSQsb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-480033bdcf4so800179f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786348093; x=1786952893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GX/Abae2bC7fTPITHvOh46JQer/yR4FYa6yMFkvRmw=;
        b=Ej2nSQsbAxKpLIZNhe90momOtmgdwx88bZd7f3z8ilw3xN7s0hduIpJqFddrrMTbaB
         WD0n782RT0m9U3La2lJILuKNgmyJ8bn8nIiLCeIVsUAz0yMrNYAb+TyvzQMkwKi/DsZT
         9HeLJ+gEmkwNV+hEaB+KJiZa/TCRt+tAlzgs3W14qnANb49Yu+0zmVQyTs2n/CeKNLVZ
         n3eBXeOldJJrJs4Blx9MpFt4e9FG0B0Go39PrMgpwdvIveUuXL2aNxnB+xkDYEsVaYHx
         9xN9zn4so9dadJ+X7t9ZHpU5QWoEuBd1Uv1GAhPmJE47CRDkUSq/gHxi1KthcxKMs1ZG
         Yo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786348093; x=1786952893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GX/Abae2bC7fTPITHvOh46JQer/yR4FYa6yMFkvRmw=;
        b=S6J2LkhKPn+DYJ2LADIWfgjEMDUnQ2z3tOLF1zNW3P7Xsnhg/8DOhs/62VxWpqnOE0
         UDA9GqeUoRMNNPO5PgBmMv5bT8Y+ACvE3oHUTnrQm3PCshsDf3At4DS9VRNC3u4uvw7P
         ryokP+59LuCe1q5KcV68ebmjAjvO8DB7Ef60KVjWs6KyKLEaSr2wfN0tzRjcewDfFOrU
         8JtMYE/lMmg6gLbXsejg+V/fB16LpNinDfbiVvgqEPZeedXowCe64ljHrdvabW1qMmzc
         2AlIU8+3Y5TaP/AEAeWwx8R67CmytkyJgh7LTj3To3BNXaqzm2xKDUhYVmQEAlLDO8MP
         7Rfg==
X-Gm-Message-State: AOJu0Yy/74HkzVc7BpK0jtFwSiYyWY3dZVooZTj7rgsgjfGyHez53fKE
	1fdf7i5HFq0RQG6mRG6pRFoXox6vvgA7OvXZhI1OEqRqlCIlE3b9Ug5imGomyn+0WDmgWAu6DXp
	JoF+1Ul0=
X-Gm-Gg: AR+sD10DYBLHUVLOBjcY4wySGh5zofWaYBST85kivjfwBmaBWhoQMxwagno9BpQzvvN
	fpvRwtKZxgBIq/Gq7WRGq6uTIxEUHf8GKGjmVXz58Em4q5ofi4HDQbYgC+1/BrlcRjkJQyYuT5p
	NepCU7JteHhtfr4fUY3Y85A3mbhFt8w1K/S7A9aH3JhX1bP6d6hE5lhDRIXlf16V+SRuuhSqupX
	9tmFbuAyOgWQQ+LWvyC3OJZtYhA4b/kAz6yUCfDPAMlSN+5oqUAkyNy1372OQKFpsznuHbfMJCV
	HZ37o5wXn1Bndq7ZxsjauzNCSwwhcw2Ibxqem503vJYS+DqD9ZcGDBLaOnYzIFDH3LyjRtBkNI9
	ntmGs6+oz7MULfwnB01CESvjP1oGWDxC8h2ZVp+FzGxA924vezdS2VsaMnjfmNlTDoU+CwOr8SF
	U1g7ss6lVt5sn7mAsb7Xsb4bPyl2ZS6es37Q/0nDVdzhTJZtV+BFOcz7S34EH3mvKqvIlqnCIg+
	hC33Bw7wyU=
X-Received: by 2002:a05:6000:46cd:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-47ff43ef171mr35368140f8f.4.1786348092741;
        Mon, 10 Aug 2026 00:48:12 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm35614018f8f.23.2026.08.10.00.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 00:48:12 -0700 (PDT)
Message-ID: <af10ff32-06a9-48af-9b52-022a0ba73277@sigma-star.at>
Date: Mon, 10 Aug 2026 09:48:11 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX
 mode
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com,
 robh@kernel.org, devicetree@vger.kernel.org
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
 <20260806091112.164695-3-david.oberhollenzer@sigma-star.at>
 <20260806092402.C99EA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260806092402.C99EA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 11:24 AM, sashiko-bot@kernel.org wrote:
> 
> [Severity: High]
> Does converting all syscon lookup errors to -EINVAL break probe deferral?
> 
> If syscon_regmap_lookup_by_phandle_args() returns -EPROBE_DEFER because the
> syscon driver probes later, this converts the error to -EINVAL and prevents
> the driver from deferring properly.
> 

To rehash the previous discussion: The function can return either -ENODEV
or -EINVAL. The probe deferral issue appears to be a hallucination.

As for the rest of the ignored return state and warning: the implementation
mimics how similar properties in related drivers have been implemented,
see: dra7xx_pcie_unaligned_memaccess() or dra7xx_pcie_configure_two_lane()

Greetings,

David

