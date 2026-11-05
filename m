Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882044;
	b=4vMV3TMkpWSRsPEIxG4Xx3r4kS8JWbEAMVpf5AnjibKKaKznwfr9KAVDDo3KNdMl12un
	 XkLgp59UECFIAuUufCoTV/BflxJDZvOdBF+RWQOFScpaWz/zhlmXUVm/MpjFB6SUGxcnM
	 zRYP5KrK27RTfQfrHGgY5Fntdu4fboOCMx2dnXHABHbL8hZ4ZeW9FvZqnBFSaMP8kjQep
	 ojxFxpjYGVdJMidLCCaQW/Ou3Kcw5yr5S9nAXIFa5ErWtdSwdNlQZ8AvTy7Ndq73vB66M
	 xGV+8qKCJ6PlFsp5CVI85sT/gX7mJtHt9NIVOv2Hxar1B0bq/Ng9fRb5wCTR9s9YBug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
	b=tS6Z4J9Brf9+/87UV0nzOSCgExiluNiRsdYxby4jc6GblLIIwVi+9EmGK5jr9SgVCtQJ
	 M9qzBjXw6qbZV7YvfTCNgloGkXVn9kzRruoQz2bem5OHpm+5M2fug46RBakFEQ95KRA09
	 RU5mfWUMeljmYQECEzhDJYuulFgr3gYwAIgrZB+cnqTuM9yJxMO4HEq0NsNLMxLWsBTXt
	 DLioADSyFcboL/rjc+69RONiVKdaG84d9homJ3spj3Hv21hLTL0G9WSGufAp9yn8bqElB
	 uiu5F9aSh9vyzlBRmU7g6TDrVuiFvBKgf+LmmylqZikNPEihf3fa3oKfCMdVmcAD9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dE2zMQ8o;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376C606A329
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 12:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5376C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dE2zMQ8o
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so6622315ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882044; x=1794486844; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=dE2zMQ8oBh2t/AFFL1rbIbyKHxbh3QLorXmWhv3yvB1DaQ2d2/1gZMbJikEqsDOVWO
         REU9tXeXzwI+pIjSa/haAQ07NuTFhrpqjn/xZ1i4PIcyiLe/V7fsJvIyW/a0UJaVE7OF
         ZYe6n42X+9ztx2l/Oks1CQkTT04uQDxnSim5P4aVMl3AyWTB7SZExpK8Mw6yTjzRIall
         RufUSAmAcknXoAuY2Vn63NjdKWwYj3BUQ+FF0YjqDoo+xx+SkXzq1vgeFAa2NZZt/KX2
         tS4cKaFy+KDeGxf/AXP2aLT1gtwBMr5vLJfoyomWytUqfltCFH5sRcGJ0sHHlExe5BJa
         uUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882044; x=1794486844;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=LsqZ2flDcXoafOXOFt7Bl91IydgXfq8O0yM1Uo4rEYyg4rzYHVAqHLPyNPJHKci60k
         VoznR8ELAAS8Fc62tPMycX9/qfZUnuvumj/2fuZlvu30S+MypbxTi7KuKY71jVVv/vSm
         PiBd4VJO8idlZr99aYvKn2FCTB5SvdsHe7wfrCFjQ4e1ZWqQx+oNVl1mymS6JujK3TTc
         JhIvqsUrZ/uClmVDZIP0hd2I5oap+dVchoF5hVw77iLrQ0A5yVdJvcmNwMXVZbpxk1cC
         JlPIg2MZ+OoJ1zH/Tv8sO8pJ1QEiB60KFZAd2AIFOl/kP7rr5FhrLuWC9ERenjotCRvY
         wgKA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+ZlJ7vN4Tnwji5dA8ifQPW+uWEFA84GZB/k3m1OmwBfgJ3VV4ikJHNfQeIhjf8PbmXjUZTiI9JqjHmWoGwo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Y+WwoltHq9N9Z0R6TCCSrqu0+ugvmfuLyxJnKeZOaw9w9WuRp
	5UhR6BrydLL8oApZvcb3g7/omNY4EC5e1cTBWrGLzM1YVQEDwvir+XWb
X-Gm-Gg: AYBFou1mQWWjrfOiUAAeAlFEdtK5gLpeukHf9IIuBDaGKzy0atR4Pw/OICXdXnjuu+A
	OkulbKB9WQQ1oVw2x6kTC9ymFr26jIwXO8/ogK/kva8YyC+gduSyR2Jrafw6vru1YBR4kcMulpn
	a2GgYHuyoswsX8rZHih3kofJKjdBfS3CdMcK5KaWnwCKGXvFyIE7lan+H7HXcx4fslZSEOiDc9M
	sxespGbHEpJJLxB1od3nxEHkbIXCTBbKPOSMZQQy6GRu0Jir6a5Aniwjt6oqG5vdeRt6rN8unmp
	2UNyxtt529zyuHbb/9/UHyL9Xt4FPMcRItPxPUh74V0bBSh9IoVLsTPTLfK66S/dZnxNMBmFz0Z
	kcahSlduYoWVUInnu6wlqjiv1kZ/x3HYuJFFPT9uSRjMDv0T4hH5ExRUaJ07md+H/dU0VCev0g7
	OD8t/vLFCzJuIKdd1LKvzpsWnIITQgwag/Aglf10bA1KRmL+NUkJTC8R17QMuvuAUDPkhWGRmfw
	Nx1l0zzt1pWRSOn+sdMWxuUyFBTkfF25Z+dcE3VlLDYebUi/1Uj3LmT0fYeRxi4A9np0Y4tfQPK
	O8iouZ/Q37bBkA6ZD3giZVayBBN8uGS5gkVrX3CmAKuvRc9aQiy6vCWe4CkeXRy+B6p2sgkOGaY
	Vf0NfE7f9DW0e7zGUZz8cGXyNhKk=
X-Received: by 2002:a17:903:3910:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2eb3648b6aemr182844655ad.16.1793882043510;
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe55bdsm17043995ad.15.2026.11.05.04.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v2 0/4] mm/damon: introduce age_ms damos core
 filter type
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 05 Nov 2026 23:31:53 +1100
Message-Id: <179388191315.401969.13923237674993632654.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261105044425.87142-1-sj@kernel.org>
References: <20261105044425.87142-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Wed, 04 Nov 2026 20:44:20 -0800 SJ Park wrote:

> One straightforward solution is extending the DAMOS access pattern for
> specific deterministic time based age specification.  However, DAMOS
> core filter is a better option.  It is playing a similar role in a more
> flexible way.

Makes sense.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
