Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421655;
	b=esifterWrDcxInkAPlVeZermeyJcZXMbs842BR+BZMWudNP9AyGPCT2E3/8D+4tYPUtm
	 7PKI3fpc4SCoWZwjYfznYG+IviZjI6CT10K2b81PXAi2sCvf3sWQCsZq655SjRBp2dcgm
	 ttoU70X6ZHKIE99PsGTbqyK8zP1q7g3W1GxHFJwKra6dentaHN2bAJYo+qH/6mNnBrdVC
	 85WkDDf5yZp4Wp+UisZ1XoSzFFZdsvYJvdRQiZB1B6cYp7aPpXTtZAZ4LqcE39L1CaKKX
	 Lg0sHCWnPUrZ/jKHVPwrFevjH0zqJA6u1W8GM4I9ZmUt09GgEhJrDChjaNNSI7PJNZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
	b=eSQW6A405ttYCACGk8bKGLU4zYj79afOlu2dg18pseMkmGQpX322O+03VNyEniBu6MFP
	 JPlxVLS7CEdrGp9PAan5b5plvf+sC4gi3xcJ1OFPu6/AKYHRGi9cTeFSb1P7oh+lW3emm
	 r14ZYGSV+iPzKj2JaL01mdGUA104B1j3LzPaVXwl4AKCdp+GWLws1IWAkHSszIp6zOpT/
	 ND4CEBzIvym+KiTUg6HwnCYN+oWMfM7ufLoG9uBrXH/g6eFFMWaxjSRHQmJRORz1TnISI
	 ym1e6TcNvRKPnS1ool0KPOF5Ush0gn1XqIoOOCVehBK46BwFTv6idccGmvR70aF7rzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSg0RC+u;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAC606A31E
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 04:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSg0RC+u
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1038835a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793421654; x=1794026454; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=zSg0RC+ulGGGYulV5vR+fqE09LNQGxsnhKCUF06C6g18FtFZbbm6igLpIij2t4pzmj
         iGT189Bjhxn1D4xRUcbQiB4LN0zgYhLH3hhImveXGxg6fEEXigcFLt5gn5uVCa3yGKNf
         0k0gR+LZFs1Lxj1ARQpBp907rzcEtJIiNeMN+rfGEiMkdsgotwiu4jOP9vaywIHrVK8o
         0Nn27QsXXmaut1IsYvarg9c583p9grabw5svxofRlNyAiHOu6QBauaXmiXiUlFIpb0Ud
         +H0UNhAsxdBoY7fRaUvg1aIwHuohK0mH50MqKzjnqjys7UTUfZWO/8EtyVRDUiFAl1ht
         txPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421654; x=1794026454;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=wcogJApyqqxeYYa/pkOEcm0/71Aksem29HNim8lWWxwMxQrADo+0D8T2ABRHJRuU7d
         uOUi4qbVnYhFGC9Xd1yJwcX7HlAe9hkCKmH0nw+34TYrkOfxpGZXxlIu86B/b5SEoPVp
         eZadJ5YZv8PxpOLHss8qDqZ1DzY8TPT3tPetu3EGxyliluZAd6x+Iv/3cp+QmWfOMF+H
         mckTCvOESzcGIr0rqsZ42tRNh+DdgE5efc73T7FJboEtQoSOcIGaM6fzrSV1vkkEg5+M
         Z23d1UQWK6lUv6jH7NNLF54FrPJPiZVTH4bk8MeWOO/j8RMWXRTRYbg37XT4oJW9ks1w
         6aqg==
X-Forwarded-Encrypted: i=1; AKwUvBwslqlq9mCetjuRZHXk1f4lrDoTzshFbTEWf2ShgOq1mpkIuJ1BVOW6MsRO80+kOTvPRaAOPhSoh+6hP5ZC26A=@lists.linux.dev
X-Gm-Message-State: AFq9FYK058++jTJwD/RZTXRZJSU7nODu3OJOS48y5+h7Xxuy/ji1j8zh
	SS+q666KpVPkylszmYnkjeOpLFdrI82xXfJtn31V5p0Nb3Q76qtj28kW
X-Gm-Gg: AYBFou3RI1ONyrocUP+s7aItyDNq2rmeI62n2ehXY5JGkxHLvoKSaNQNemiMU9SeWlM
	LqkI/YUJ3ZECurBPo4m1nkqdf6OpOzJF/1jfDYmZjje21TN0oUDV6pqTbvTfUZUtNI2PfZymS87
	4fPDO3ULe5uzh0JXpz9pkM+4rnJRtuba0FI7sJXTU2uRfkgDzPVClBVq9Rez/XeeN7fjaDE7aEZ
	KJC2icTW0Liz8BdaNvXURNDDMGRzZcNilyDCCwNkPFfLXbEcpcqYg+3LMkcKJIgvq/JXUZachC4
	B2mZXjm9INqGRDYRBDLY3svbl7A9he3qVzRnP9700UMudFAMbIEkioqFUR2J8sgIfaH6sJVsgry
	61B1Ijg3G1W7OB2a0dZqKxHUoPyIdVdG3kfSuYHJIy1H85vg3+jOs34DclkM36GmG+m1fSl4N8l
	sOy5gNvpp8bajW6QbPvZc+yxjzVOXG9Ybw5TNPROCTksH8PMcKSk9hDBsDCUztcamC0RjUJuHxG
	64tXVSP3BfWbR3u3GPL66i29t1ljvcThUDr72ZZl1N6y8NNKmE0S4ypdY30mVrHtXxpDdFKZNgu
	O/1ngFbqVtO4m0VjF+NgKFYKkzyxmc9cJ10j8QH3okjYibMRxz+FfUmWYFe+RURKSJyLOulj3Cr
	AYW77IQcrrQ8smd5eCKZx/UEWJZ3+MUKQ1DUq3/LzsdyF+gc=
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr3599348a91.61.1793421654153;
        Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm6093012a91.4.2026.10.30.21.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:40:53 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sat, 31 Oct 2026 15:36:00 +1100
Message-ID: <179342136087.2.16978105493403840270@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261030044643.157105-1-sj@kernel.org>
References: <20261030044643.157105-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Thu, 29 Oct 2026 21:46:42 -0700 SJ Park wrote:

> Define the value at the beginning of the test.

Makes sense to me.

Thanks,
Aveline Noir
