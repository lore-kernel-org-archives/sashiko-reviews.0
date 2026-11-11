Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361793;
	b=QpmNzDrgPctkAUtKyYNHI57zEGNsnenpeAAmJ0/LCTUGbvF5DePLoLVIwiXlYExRT/g1
	 +haIpNPVPChFsMGDVaGkp8dbMJ3Q7xG7RDHS6/vGUzPg4dpHw3K2a9tMrpfVleoiND/PM
	 xwJpjTvEyg1xlmQflirCzo5oJ/nqvOdU4npmUPZVtlF71gHuKQSYw3avDsANzQdY9caZB
	 B5uUM+1pvVNFY5c10daY5dNKaoZveY0CIlckpetxTcz4p6AmZt4i7b7FVTK0VyTfwk4lX
	 0kRuqapreUIDHdI6U1fonbf++pGBxm5/YRZ4o7yJ/lUWieLBoUOkZ36oKWk8D5FyntA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
	b=T1TIR+mCZlYdK0M5SsdjiqwJBZLbxgec1OPh0zkTI4R4ejhYyssh5TJzT9An1nYZPP0H
	 EaoPBZwKMGPeBwDA8imNTPUPO7WH6wP1HM69sjMkZuaItv63eFo/NKV5Q3TFG8cc37871
	 SAvZH6uJa0Jz3oqL6uD/R3jy13I8ZBhZpxsMTsJ5NGhgUYa39jTMAmRzXYrlbeeILyk43
	 K3X9O2FEeufgv4LtqKWIn5aIuqCAx2+M1GT6ERKt4V0dXvBp+/R24JA+XPTq2U0hbLTgN
	 prlBiGJjkFdwmi9UhTYBtGEyT8rvSlziroV8VVv/K4Uq/kof3HIVWkGitol++QX8Gag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzAAUM7Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D60606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 01:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D60606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzAAUM7Z
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed2bfe3252so10163975ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 17:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794361793; cv=none;
        d=google.com; s=arc-20260327;
        b=jWVHiHEmGZiyf7n190Q1FFM51z/LvdunKfisoxtKjePxSFIu8ZUEX83DbYLRDgu6W6
         7XFyfKsyJSUlPC4UrbIa9pZyWosb/ENKG+gB8810A6J6ebHvbDyCKXH3x8z8HhYa3KM/
         q7CDRW/C258mY10fqVu+x91jRwAYBM7MB9k6xOgwEXduE7fwYR4CvaO5pc2Ax9yHTeAG
         kfhVNHAzSMBUs28yIs+wwM4Tl++numUCs+FWLxm6vRsffzSrhze/ZOPyShFNa3fGpHTa
         yroux1EKinOduUnV0oY+nLm9jED7gjDvhqG73j1+tk7WMLMV3OHNWsMD0hH568nMx1Fn
         wPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=pcIokE4+s/YapXBq90dToYEeU2Jmcg5w3Tk93sUh9DNI4bgkPdvhA7E2HqVwPNdfo0
         tJJ1K92CKB6aWkeJfv95TlxrrcXw9THeyPCBYxNqEnAVQ+0TA9KT8sL6/iK3cxw7Bw6R
         4oCwfiiKIgpodrzcyVpXzmrDS3aMgwBpRFdFo52pnlLj5O+KN7u8uBtVlMjX3FlMBgmw
         vOCZMb9untGmxzom6HdJX+P/Ta1N4bl/gN5fD7K5Yq8lX36ZXYnjwcVvTa8Jda7isQO0
         piCBcydDBpRc5GGM9RNP4ZYJoQSSVmDH8U9/i/yyhJDCSzyhp9jpRT+6mPy0n/qmGpPg
         NUcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361793; x=1794966593; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        b=DzAAUM7Z6F6Bp1rDuGzqkxcZJUIimv/685YF4hrm46aGTPkgsh0wpMvVxyqmMfNK2k
         o/fALQ+R1nXeoR71dFTDiVufu4BjJLf1iIYvdBHw7PeYiw3KAxm0VC4WxGOaHXJgLpCB
         +eGmv7TL/BEdrU6OUVAwJRhMajxHs2kz0xx1fqfmpzsRDBgQ5vlqpiwkzvDBvaFXenPF
         3C/6WBi5grHAO9KCmszc4JQ7PFlVUoBOTAlwgDkTHRNbDvULSCdAzaeSXtMjL/yvAgSd
         Wccj2CDBoWPNooeNeNWiRZx1QwJffqpwRaKoonRVc1u465luf/hqL4uZVLr9nUZkI15+
         SUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361793; x=1794966593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VDdksnIZ51u4SA1+w5FzMxah+sSDW95kejJrw3tPOQc=;
        b=c1zdQq99sj4RS8rLDppnzlExBFrPSZ0v9QWrbDWoN4BPkqfZjIKHgbZNJaahP4AddM
         e0Lj4Lp/3VvRJqc9XNKPbagInTf2LLxHpYkFksgAdV6d4tjwQxuRJrKHQO8eohR1Gpf2
         2i+UAq9Ayo8ugr8CdMRaa+ZwIdf3e3+u6WmcWrlvBnaU1cgw0PlDWLuqVxa50isojuzj
         0Zf1PEgOE6bS79FSIAgcK83E670AOpA/lE+OzFOSA12mdxdlnIyzSye7APhmOTrL1NX2
         Ri4HX/Ttdngm+gwnaLehtUFN7NoFi7TWoEg1gXwqXX0DkDW5tUC8kc2JcvAwA6sI5FU1
         8syA==
X-Gm-Message-State: APuU4Z8eGJCxXf/73EeE5BLcawabByRhjLGxyDYa6gqDRhL8KL1u4T7k
	z5pQA9EGFfvgxlzatTgX3HUTaUQ/uwvSLF+0XwwLYIrY+1E2riiTM3Jr/tfPGY+FehoMoBZrZGM
	NzjBHHjzbQ+UqJ5R9JF7NTpBhf3oEOz7aJo3D
X-Gm-Gg: AYBFou3vdTk9bCredduzDeZkbt8G1n6/2LNUgcdtR5B97rxs7Hd4MqiQ54Wr2NW9BWC
	i76jHgM5Uh0OrLIn+XHf8t4Ve22logTdDbJYn6wXZMigre1CVb0Zy8LHupXje4bGhdQpK3cZ40o
	d39GYr2VbpQJW1nF96sxQuD68Mf9H5E85/aZ/EL2u5O7vW2/sbk7hw1YuVG36vE5AxqBrJ/GKNi
	Jys8ty/kM/dHlu5XbnsvFt9XOTsO/UICB26tl/x8cNN24RtHzNLkWoA6Vt9/5yRhibghoZlkDuC
	yIs7N+B8/kVXjPPSE1TaWtUzNVh10sxzNIgcYha4RZJDnr8arruzz37fS/ZNx37n3jB6HwvNh6j
	cBwqtehsN7CPKLtICb6O8WcI4mYPIPS6CiaW8obM1p6XttshUOJ+B6+tV/mIxfr0gLD1scZJjg1
	2pQgM0hfy8/gXB/Id+9OnddjwENbBHbpGdiUkOSfH13qi1E83a/rH9FxtxxQdLCXRsxImspA==
X-Received: by 2002:a17:903:1a44:b0:2e9:64b9:a330 with SMTP id
 d9443c01a7336-2edd770aa68mr11073695ad.11.1794361792649; Tue, 10 Nov 2026
 17:49:52 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
 <20261110095525.504660-5-phucduc.bui@gmail.com> <sashiko-outbox-206828@kernel.org>
In-Reply-To: <sashiko-outbox-206828@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 08:49:39 +0700
X-Gm-Features: AclHuK8KXNuOVTdyXRsPKzDhKnjywq8-M4TuAaByLK27noLJZJj0Dz43IhVpt8s
Message-ID: <CAABR9nGcZ6uD5z30NbJ9sWLEDiFhF=KQ++Kwp8tPmST0hFweEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: dwc: Fix DMA fifo_size calculation
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> While 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
> added the calculation in dw_configure_dai_by_pd(), the broken fifo_size
> calculation in dw_configure_dai_by_dt() was introduced earlier. Should
> this also include:
>
>   Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2S")
>

Agreed. I'll add the Fixes tag in the next version.
