Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850558;
	b=z+GNQBKeZun74qDNR/sZo8S7hlXV2DbVaPY41W7ntmd6K5r67Ju5/eZawkMvGzl++NCx
	 NbO8AhPxT0iDZ3LytCcB2OJhr1a3dLykxe+jgTt4PSwDj3NQHLdBpe2gCGRMWXe70dcz2
	 Rse02AHXaQ1xFVzc70KRUk4i37yg8rSoAlJ6pb/aAPlW7h+L2+mQnXj17nWIujl22eNak
	 0rzll2XXJJ6yJROuJsofJ7aWuRkRMViitft9KV5Er6/JVQ3P7dw2yPZwJqfn5SGQae6Bp
	 3UJ+BhS++TvTCNHqrQIyOuaIXW1DLK5UZD9Mu1NzCR2tWhl+9aJv4JjShhhsciQhlkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=y4nU+7GmrkUhOBsr0Dvyvpzl3jqiNJEoaoOiBKCaNL5LY8zpKXDwwkChIxFUw8IV+bQ9
	 tALpSQNHgEZ4QCWjG3iAR1ww7mQZ/BtSf3AomlB3tZEqtgBIS7OOB9Z1RSghQAoF9aAsS
	 fJbYjB7q1yjnAE6frPBX+V0+bxpNu9kjjAVc/eV4Tx+o4JMwIofnKe/MunMyMqaeQHqrI
	 MKs77XEopdbmM0J8WrMXoecbFakeqHecfMvJ9A98HScq1QAjrs0GPjxffZioSdu6mUiEu
	 dn94TzYCN+U1UqWL6KBKz9l6yK9EnIaVPGp1gjg9Lzf/qgfnIljWZGPRMahqRtgBXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=jyrOjTyY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93608606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 03:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93608606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=jyrOjTyY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so951183a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850557; x=1794455357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=jyrOjTyYYaBpGmcXQsA8q9Itvv8VEt+f/e+Wb0pnN8a/IMr7w/Y0XzAd58hyuYGDqh
         DQIkdISF8jFSKJRjbTbfCfqUhIMl6DQsf5FOy0ZwNqjGALcXRDe8EGvioRUdws6JanwI
         GuYt8ZvLoCGcpCBf9FbVR7ctKAdyKSLMfp/ENFT1yYAVpBif+/QWtPZe/R6xoRVF32Z2
         6gtW+FsIKf897EelXoUA8LnyJMMVP3fUA4a6nam/Fvt7F/fjrjCukOjv+SH8WCTiUhv9
         8R4MrqX0reCShmQsyB34idxkdaPXOOwmh2JHaw8Zj6lJQV3iyU2ixiRC4/Uwl81a99Vo
         X1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850557; x=1794455357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=MdlNq+kG0GElzoS/j3UtUb+r5LKyZSLGwpNojTGS7hW3EeSeILjQ7GCjDh50vJ6Xvp
         kWvAHd2Z6CmmS8ALAk3Rp5+jLUMtuMpkfW1NCQOZaxP5t1xqz/TQRzTK985DvrHWGkSd
         i+r8x5peHT4iwP0nso/8V5X+RlmfPqYUWeo2KNzrwi8VGkR8Xq11kLScnOeYusT/m4rr
         f6wt0B0HPeePrRWGru9mwnyKDPvgAKHDz5+euH+yYMe2o9+i5eoVgVJheUVEwVEy/FKd
         7Ih9D8sv0z2SKHUrq94YpcPPnvUuJtrEM7pje/ikKM//Jg6TEuxeFiX6pQ51K8JN11Je
         ockw==
X-Forwarded-Encrypted: i=1; AKwUvBxNJFJU1XxQKI7WqXW+WdvifeeiZNi17QVngvl4p+9zOO5Kgsb6+JybfSj/z5JrSRoPNZeJsdrQxWs1UPfV/nY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9eXE2mxSnijwbd1FE6Ymrns2Ygply4nwlhWrZ7+x7rHhmKwZDo
	4Va/aZwFBTS/+zJgIx1iYSQPg4Pz52JmK6cCFhift+xXt7DTEhN3aNgfNHJeuSWVIow=
X-Gm-Gg: AYBFou3cJpPSuVwe/9/cTgfiv5aQS00sZJKcX1spNIsGurebJlJn+IYdyEgQ9VF/vI2
	0nfiYS9n4fh2qwDIw8uZlMlavSJdtw4x1LB1gx5B9BZKyEPV97OvlBeaeZ7KGtYtuR4FYD1UbUm
	EVd7kjz3nOERWxaPqjIbdk+3A+dP+xqHl90IUChaJ48Hr9BRHwOMBZm6gcco/geAneelHx8ta+X
	B5sLEJ/vw5APmwlbBemj9cZAvgK3rc8F1+aPncqJAcAoty3ZgJcTehpoMsFBlpdcTQqinxahVZu
	EkEjnTvtcxZ8gaF6VmDnYzhDEyODTliTbgyzDjb3Z2l6JsCeRos4ALkZm2sej+9y9g4bSNfDTdn
	1ftjxHOI61hJek0hGEFQUMqJWkwZPdVFpy2EUbM+gHC8upi+2RQTpkpZbu3Qgn5+s69Q2b8/sP8
	0PZyGm3VOPcII87lAQYZ+sS6CUm90nnIdkaAdEUWqWAg42XSVDLLQNVj0ItIUtoYhgfUZoDNDfA
	FlFSwKddVYW7/evSZ2j3NQEDj8+RU5KY2sGZPi23K9QXPCLiq8hCU9NPtYPWhYRXWpoESBR2H+2
	rpYwfvitIGvws1l4LVzesHpexYY8mO1hhwGWmBwMLA==
X-Received: by 2002:a17:90b:540b:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3ae8957cffdmr14128129a91.9.1793850556806;
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm3564391a91.1.2026.11.04.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Wed,  4 Nov 2026 19:49:13 -0800
Message-ID: <20261105034913.25463-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-3-romain.tisserand@gmail.com>
References: <20261103110524.2812831-3-romain.tisserand@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
