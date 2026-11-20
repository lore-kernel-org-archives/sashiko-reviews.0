Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207349;
	b=bKpEpZq9qbNCy3ktaK2vPnlZm1h68LaE3BmTOkOoLGEkFoeBgG9Rg+eJcBOsRcAvLzls
	 XjTXcI8deF5y/0mUBSfJTK/ATAKxhx+gBZae2wiJ2AVoN4X+vGUlHXIGUdvMSHL0GUlIM
	 a229p3jekTT4f/zWUqjVVgvqjsqJFFDhkAKZ+sqMkaEggnltrvs0zutXtmvP8X8rb4Enb
	 dt5JJsOUrCuanlC1MKE9GZ6ICNNDvYgeVYEfoVFdgFDkLDKCVrXIU2Z9xQ/mrvXTYGBCn
	 ZALOZ2lKqMbvJDRtZVPvO2lRkLjqgQ2MruHmhn2KxgQDpOXx8liy0WcGgVwZ6SY2l5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207349;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=fuwOvDlbaHnKX2tXAoZ6681tGyf7Tt3PYUrrz3DpR3g=;
	b=ni1nhGRBpyP0IbQno0TrOcX/1NnW2ezOnP+WEsGqbeacebwWpoFFAiFGg/8QInMRbRZ/
	 xujt3PSwOhGEfSOttKNDMsi1NYGwatZ+5vjNj2nTRy1Wc9gLLlilTu2SdKbnxm9BCCQI3
	 UbUlO3RJKC7+bX7nQwvC0P6fC1KNTU3PeyNYGAPvzI58oAC9yeGp4kGFHPLJBaiiNpqku
	 rVv81eFouTZe8ToUwMcmtAYzXGZ3ocV2rRpT4qh1gUpEvJGxDUk4YSY95dnegjw+rh40W
	 nB+3YYsfG04FRQN+/sLtHg2dI2ztU6rPJtiVkZZQsxCTyuWdNJI8N8D7HNSrVtuB1XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92E606A6D3
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC92E606A6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5364d86f7f0so14156141cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207348; x=1795812148;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuwOvDlbaHnKX2tXAoZ6681tGyf7Tt3PYUrrz3DpR3g=;
        b=wyW/ZDpEtaSDo0x1Zi2J42YofElMUyQJrbKqLUfVPE8MfWGnUwZMU9eh5dLRlwajL8
         9WyyQH2CaST5aWc8juXL3tiG6WbK36rTz6Q7QPnX1jwWVXgeV8SHEihm3zuO4gauiE9m
         uAVoJ/QcPcH1o9Hd7Pi/kSnP5gI/k4BsPap/JkHHkT0ytaWRLSmMFaAWYORRfNyoeKSg
         OYeRHDGpdw3XeZozr/y4rYYQIwuurMPyUOcle8Ea3M4zkta5HKRZGkUAVjSzx3naT6ig
         WTFUlaOMnGBQBM9rjWE++FEleAHHRJIEqvkm+Wlq/f4t2Byk6PJsIXE6W4QNcdYC73op
         FQWw==
X-Gm-Message-State: APuU4Z9lC1flUzuiphDqEnGYSNWekadrfaZxkN3VYB96l6slXspnvaTJ
	QtvYdQMQVBd+x18nu9EWTubSYra4i3LpMckdZl9ddtm9eZ/dr7u2kMWCGDpidg==
X-Gm-Gg: AYBFou1cZ2YIxo3JF8RNxH46WnPTSekCQCNFlC5qvHIkIGw+6JedxOx2tt4F2NHPVCZ
	W3pMqO7lkTvAP0XVWd4GPGqo8Fr1jIOqATF3bq6YxJ5KTtmWtEDiIVixpOaXtJ58Fm9kEMFWuWb
	ipr3pyD8Kuffz1ZeSWkL0Mij9EYVJ3OXrzdDWVNmpNnCQaTtWQc2RfeCiM0OEybVw6Ph4ebCNV5
	x7lDH5zpu0HSc/hPGVGVSBu6CW4yBOQ8bCkBunDAIa8gQsTtW9glV5bbdFx4Cp+2ntySZ6pvVnr
	g7PbsZx7uvGglMI+oow5gDc/q7YO7D8AK430x+yPIjKPgl/y4Xb8zit3NZ3NXls4/K1g10/Z/h+
	bG37oX5xNS6+WvgDm6aajOMPTuXPqOwd5kun1xjyB5C9FuGCVqDGygLEPs3XEchzYFOohnAjVAK
	Eef9bf/B0OsS2VIfWYrhL6TxXRNgDDzhm08IbFfnkZ7dYX4l/1RzWo7B90Cx/13CCdy21wSxUDc
	eKOukQEH2PgP91LVvUpHgm1Z9VTBwIS/BkrawkVPOHpGcK1+4iXxIIdO6WnjZfWZ7DswrPPJdrc
	+zPLnNzacXfs3nHJcdAn+dinBZCtxyynNZWDUN7fXbBueRgyP0lOMInFFzBg4OA8GLd3ZyfOfqB
	IAhR4E6Gl1OIrXfK2Du7URd5BddIXGYDGBfJCznoJk81hW6WtLcB1
X-Received: by 2002:a05:622a:5a1b:b0:55b:8632:6d42 with SMTP id d75a77b69052e-55d769ea681mr75958851cf.23.1795207347888;
        Fri, 20 Nov 2026 12:42:27 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm32990031cf.18.2026.11.20.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:27 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 6/8] bpf: user_ringbuf: Handle position wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711433.18576.2331241177211314374@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260619004007.EA5461F000E9@smtp.kernel.org>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-6-33fde039ddf3@kernel.org> <20260619004007.EA5461F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> ringbuf_avail_data_sz() uses max() for wrapping counters

Fixed by 3f611e9b820e, now in the base.

> [...]

> 32-bit user-space processes on a 64-bit kernel

That requires a separate shared-counter ABI fix; native-width
subtraction alone does not address it.
