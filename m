Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130133;
	b=v9jRF8uuU4ztGPMYAmOmLCUPb9zmym7b0OVMDE5GULMbrWVybUxFaYs3x4V6HcBYb/E7
	 iMjt2GHPXsE7IWzpXeEbE2gYIjFNCfMGYhQ9J8ECmHGWAgaI5UlaZr+wbY65ADaKdyNRv
	 Gu/63sBdv2RwFV7WQ5DDPPWydEroEQJIfE38K0NmeF/bVWmNdoIof2RmO7AV4owm0uDpZ
	 8r+aMtwIhYjzVu8AvDy7vG7w/ozRnFWMnBdhwymijkgKC7jV8r44jtmNHkRtFwx7z0+n0
	 OUMCIGqpadHj9o5p/z1GRXB1S5x6RnXJVD83xSrsdv8MBsm/p/9GHTzCjGDFqPDrQYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:Date:Message-Id:
	 To:Cc:In-Reply-To:References:X-Mailer;
	bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
	b=2UR61eRD3E8TjJcGDOzHGdYkVtV82hIFudrwQQkgv04FgjLpAUA6OabbQUBwfw55dKx9
	 jDelCwjQKnVYWcOsHSShbRzKY03Z4j7dfXlyieG7PYwA2i7dimfAjbFtoyD9H/u8wYSj8
	 HkoQbAc+nD4xRDgSoVg1NHUvkYpwVBOP4vcauKA3V8qV3NNgFeUdaD9YK0JBCgouQ8tKz
	 PWzAOnqhHNzGCJgSAKsWlyk9CadYJTrjwAkXyJrDYtX9NOCb9+9OkOF8s+j/iYM27SZOJ
	 uGAQAFUDc+fCPkUSqTesa044PODydBVhg2SIKjn5zM/J9rTTkMJOlVrnhr1NSNHjeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfS64Y6e;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412D606A31C
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 09:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8412D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfS64Y6e
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso9320eec.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130133; x=1794734933; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
        b=cfS64Y6eQnzyB9073PfIlxIleoy8BlF8XEx6Sfu3aJLZuaZVEx8vCYv1Nz5RsFXFzb
         BDnWcQvY11TVLVovniCzZOWUe9URnC34HhBfnTbegyDFtZGbe47TMJyi4A/nJSp4h6CE
         ILWixj4HnZx+dW2DY0ynty2muwZ4SXTYKnD4RBVTTnPj9kbu8tVc2YbcmpQ6wTZIomLW
         YOLteeElanwnLwwdCs4yDYG8WENqKYRTTBKDgQizC6c4pgGxofd5dsifHB/tf+aHXhNI
         6zg+T8pZEV3bhQAxz4ZEEnAHxGjLN6OaGqR+N4L2UToKCRGXrGsSI3t5z6CdpRKK0osB
         6gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130133; x=1794734933;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
        b=lgSyP+TaU0Lb3BabcPURPlM1JAUyuHLh4NcD4tuH5J1h3y0ypV/+MLCDApC406d/9f
         ux+RkaRd85I77VZmF6fCMhFJOGqjAHPRxKnLTlVs6dz+y5Zc4PPO8YsvimZLt3Tz9E85
         21NdS16G23RmOMfUK6jCb+RlyKsEO5XPzjsoA1gjUPAjVdgPjUK6nYCn3Z9B3ZCGbyHU
         w7Af7mV3Kr1oliEoj/ehbldNtw9LnJkTK8H3MXh3Fr3s0pUMcbT2YQ88mrG0uYnqSvEx
         CyFl3S+N3N7U93NrneA7f1nDBlCwSRCGkNL23DJCUPWMO2FJyivAhMvOeeLMIUK/I9LK
         y5Pg==
X-Gm-Message-State: APuU4Z9xm9NWY/fFcSiPIBaxGSPKWzplNfHDZK9+A/7CtUy2CgeM+zZh
	RwM80QO+kRO7tQcRLinNYBwkwbHD6iYtPEsyzV7FlpC0jNmWHdghoI8DHjrnWU0IPZl5WdVZ
X-Gm-Gg: AYBFou0FzBjnSdnPECGPoiOjuIm82FxeBdvPHFUgKJYOSoyexpjjZj0NlqE9a3/MvaP
	k5uf/MXuScOZm+/1QwH029fKvFCOgZ529TNhYz7KcLjL0vhUR3fR4LGEbYPQroubWPqOAGvhcQ4
	eTK70NaXZJWMkh2XvUK0ZP2VlYszfnYepVRjUE+QrFQZBb7FkK9vaAxHCk6M7r8OiL20dHdNlK7
	sdGaoQYH/Di6mHBOBKwvaSQs8jx2bNdbNUojrL+spzPiQjNxrnajPyxVhiIZ3YKAticS0iSfRu2
	b7z9opZyvXG8JHxWkdN5Ogl7Flw/x6Mv+JYAPYrBgoJ5TtXtXR7Kg8oQOnMcv2w1jCy2CBOcN9e
	Sj7zF0fd7ltdd1IG4IvEDGkzwsO1kZ23usK80B8C2N0MSPiTn6azmzNzIWC2XKw/4vPGeigkg5v
	ZPICQ61ZK05NLK6KGIeLxTnDxjAum0dDzgQyzhOZztshwvfMmTs0W1SL9/jmtdrd5iuiNFzTO2V
	y4grRgMBirXtUezNBhCl4Oe6mNNOGA1EKJmEfJffqVcI7JCwcquYCEfS+lU9ewtyj2QRe/arsat
	hRJfujqqE+SYr1lWljzlrHo2QFI3zPXOm/GBHzRso7C51q6MNdEVR3YCBItGguxjJqAFUwpNZz7
	R0tEK5Q==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-372571d9ac9mr2446013eec.26.1794130132533;
        Sun, 08 Nov 2026 01:28:52 -0800 (PST)
Received: from [192.168.50.20] ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d78ebsm4250150eec.27.2026.11.08.01.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:28:52 -0800 (PST)
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
Subject: Re: [PATCH 1/2] drm/amdkfd: handle SVM interval notifier
 registration failures
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 08 Nov 2026 20:25:29 +1100
Message-Id: <179412992976.2.9438818840890765075.b4-reply@b4>
To: sashiko-reviews@lists.linux.dev
Cc: David Airlie <airlied@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, 
 honghuan@amd.com, honglei1.huang@amd.com, linux-kernel@vger.kernel.org, 
 Philip Yang <Philip.Yang@amd.com>, psirt@amd.com, sashiko-bot@kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>
In-Reply-To: <sashiko-outbox-203586@kernel.org>
References: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
 <20261108-kfd-svm-baseline-errors-20261107-v1-1-9ef4008019ab@gmail.com>
 <sashiko-outbox-203586@kernel.org>
X-Mailer: b4 0.16.0

Hi Sashiko,

On Sun, 08 Nov 2026 05:35:46 +0000 sashiko-bot@kernel.org wrote:

> This problem wasn't introduced by this patch, but does
> svm_range_restore_pages() pass a page number instead of a byte address to
> amdgpu_gmc_filter_faults_remove() [1]?

Yes, I'll fix this in a separate patch.

Thanks,
Aveline Noir
