Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65535676D
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780238198; cv=none; b=Zwlmv1fBjz1/kbNFgKJyLvc39Lhd8sq+EYcpGzcWS02XYF9JqQAwvDhJEDiNwmoJG2mcUNoUeG3/zCneGBgZdMaf0/x4e3GwbYTuT+PhGUtYOZMVPIlW4UE9vOblV+ks+ocuhh2MkwKXSvnzrqyuDeUk/+FGYlVPWaaymfh19N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780238198; c=relaxed/simple;
	bh=VBfST3UXgyTlkP0EH/KCc/5GWH1k8BUjMNuhwJhVe3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHcL3DYYSD3JISleBxqWEfmwrhwguCMp/itpy04GnIQ9lILp0k/i7VK5vq5QCC/gRyatSMdytQ3iObrCTOYMK1VLkVAaGTzjoS1PKOIksOhi7c/LCAUWuj8E+4iEaYlEvJhfVQpmSNnhyEH+UpNRxv9t/Hz5bBu50l8z76VetF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHa4d6ll; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHa4d6ll"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2d792c8so2985155ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780238196; x=1780842996; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAmB6qU0tUcDyuQM8cPLpHCE5VdrhYXfLUEjav8vq/s=;
        b=hHa4d6llc6zpK+9jUf3uUeDl361rmiKwp0SCm+h2mMDGKYvgUdUsdvXLAtSyZCVt4s
         SLvcrUIg1x1pS3xalgAr8AwYFsn0inqM6D0a7F6C2YkKjZNGyLiZnOyRRV2pW16kDsuH
         dohJ4imNBwNCCxE+2kvssFq3/ybOYA84dp1PcIOXhsbi/Zn4UXrxAmcbPIzznlDquOv5
         vtdl3OJVmalxbodNDyFU23dUJwiM7A/TczzWqzqpcT6sJrpXO8kqY6nbgUacZL28PV4O
         T0AEFe3+k4tOSkUNNxpqooJ/g0wWZwfncmwe0fqxoDwnLD1/VUYLossjB0+cBGK+r0Zo
         gP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780238196; x=1780842996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAmB6qU0tUcDyuQM8cPLpHCE5VdrhYXfLUEjav8vq/s=;
        b=Wlclyf7LMIVFbutdJ3AVpKspzYtV+qkiY2iOMy/RGPTVWO1adKAy1jfU6TrIPZI0wz
         DO3uOtrprtHmM9UxiZdjCStd08OheClRVjWxOHTHWHyftnSKWY8ARFW27nVDS3q3Fk05
         hOeIY+Ba4TVzR0QyyR+JuNhmVgsRb3DARQhOFZr0aBZIpr//fU6iHEiWcUfIWsWk7Ke1
         qpr+d/R8+5pk4hwtL08E/2pzEYCEn8RmlM0IrI9dfd0uIVkM5nkJZD1pSIYCTsWZdhaU
         7cPUuCBmpclMU9K5kAUocK1qCnqvrHg1QSZATY3upcpksBNY4kir5SdAihndCP2y216R
         Ireg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZdOUQHhvElM2NpIcp02JZ88UE6aOQ0IEDpqxctfbcOHP73quUtM3SXhnwbp86B0Ano9ToHoKO8dIORhlCQhA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWTIpBlH/45Wf3576awYHUbDtRavLZdF2cp+xUX10wVZswi1g/
	de9EkWf91iSa4R0o4mHPyghRwdIvDyqsQpH81+640Mtl55Sh7uXMD91H
X-Gm-Gg: Acq92OHtoqYzwgzaWPQ1IyVgzpJ9ai/hPazhoGqIOjcDQMh0R3zV/9BLnEt2FCbltxD
	2OuOXGLMjkjEpEONodjd0IXMdbGOSkmoFt7WkKgWNbGVTDgWhpmGyCXUF9NHDqEsD21K9YULmml
	v0KnM1iuBANwBYI+AkN8cHigfGpJDnpm5x3CnFFDknTNiEyADXL8EpB3OTOd6wCQuFsZktfyDTF
	yAMGylmrHJXA6mNX7O/HmLseIM6m8OR/X0OmIEP+rngzC8Je2XZQN8yY9o0aIabIDKIvfEZEac5
	Su5DhMlCAdjfpzo4gJOcssQQOioIkGNMzxk5b6Q8l1AupzWmv6+xxO7FBMR13gSvxKssbHhepyU
	SCG1di8bMYHX3jVxm4ldCSl8oEQFiBtMe6x0mfKkFZWDTcZixBikBhUdTqR6lrYpgnqmXzg0ziZ
	n9bWcazhLw3hiFwqggc5E+fWn2Q1Gmfi6WyTTdrZYrCzw8+DI=
X-Received: by 2002:a17:903:3585:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2bf367c1435mr92914815ad.12.1780238196196;
        Sun, 31 May 2026 07:36:36 -0700 (PDT)
Received: from [10.4.72.5] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0121fsm77749365ad.49.2026.05.31.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 07:36:35 -0700 (PDT)
Message-ID: <5ee310d9-d432-400d-8506-751ee4a41fc6@gmail.com>
Date: Sun, 31 May 2026 22:36:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/2] KVM: Validate irqchip index in routing entries
To: Greg KH <gregkh@linuxfoundation.org>, Yanfei Xu <yanfei.xu@bytedance.com>
Cc: harshpb@linux.ibm.com, zhaotianrui@loongson.cn, maobibo@loongson.cn,
 chenhuacai@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
 sashiko-reviews@lists.linux.dev, seanjc@google.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, stable@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, caixiangfeng@bytedance.com,
 fangying.tommy@bytedance.com
References: <20260531135326.2238555-1-yanfei.xu@bytedance.com>
 <2026053158-cussed-outweigh-6f0f@gregkh>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <2026053158-cussed-outweigh-6f0f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/5/31 22:15, Greg KH wrote:
>> -- 
>> 2.20.1
>>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
>
> </formletter>

Thanks for pointing out the correct process. I saw
that PPC maintainer added "Cc: stable@vger.kernel.org"
on v1, so I mistakenly thought v2 should cc...

Thanks,
Yanfei

