Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851530;
	b=2pEz6iorWlY0VSIeJ7PT43bJ05v9k9WblwwpbYEDD2437cYAVvWngxNfGnbzjpC27Njq
	 z4TbA8SpUwcVWI+OhBWXjlSfjTSjvhOpsGG37V9hsHBDAspEaxyp5xJ7A7DqqrU4MWaLz
	 U12iLYX9MM524DnPl5Tm8A16p9YdSp+BlS9M00uBblhRpWH4jBQ6/QqmLFzAybI7X4zRT
	 en26nC+FbT51y0lc0qCJkKZI2kL+5OPqZL2PjP/EsRy71QQtYbDjeQbdk4oi5Vj2EDUqr
	 rwGKATe8A3lzKrNm2JC61tXZ6hkdW2vDs3lqStZftwfju2ep8gH0bQs09Pg4oI6/lTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
	b=CxowLkXojhfJxzX11FWg5Ll88KGtd6RjlG7/eJzJsY5owN0TrdFuTQuSi5gZUnLTR2cG
	 0zTlC6w9F7ZH9EwcBUB0CfR501X8LYhbrOY2TvKlHjzbWzMFkCG9/9rOlxapvpuh3DQLz
	 xZ9CpVJM75jjIKrTpuRjwvcLIT/Mgyo1GsDfK3hmr9rkcArOIjTSbIP0lhNQnEC09V2i+
	 Rw2CGua5dSwS2h0FIQFGGJormT4cIhmBLzPLt0nKU1KNSTmImKZEX0ajG8bU+qefeMht5
	 L0B8QTbr1R2Vrgc17LrkCnAGCZeUPGUg6rQsIVRMOY8VB2afL6phM8Iv5qtGkmrwG8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=Xla7ZbYA;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B27606A32C
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 04:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B27606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=Xla7ZbYA
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1139626a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 20:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793851529; x=1794456329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=Xla7ZbYAtlTD2QCq0Oeh9HVZA7ZHWbqRWSWIvn0JnChaGwWYDW2e7PAlweh7ugmpvZ
         J5xBAGyvJQ4AJjCl+QBHt/RiYsBcW5DydeLbd2ELh4NNzZw+YujqmIpkg0qFIMq+0bVt
         8hUtpE2gb7WIkTpUPcd11WfLKlwV9RNV/BLHKBGSZAfMqlf0nrGXYrUDoQJ8GEXuxGFC
         DLKeYSaU/HAPrFp6s6W9iGJH7NnFVaIhF3a+f4vuMXi8YPP0URh+kZMfWp5mybMeYdK6
         +AnLyTqvdKTcwlQl6ChXh8hwrWLDD6rHkwl8Zt3KnmJB588UyIWdJF9ntVVL0VKcbfNB
         2urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851529; x=1794456329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=IoLPe5utN9KEj3ZCuUvnP3NKf4yCY1Rt7VxLysvt2dkbu5KadRE3p+ZWlaUoXNPuEM
         S9wk9ne2fimmF34iLPzomMOGDtmU+GUagSHKGSPX1UXC6cBQZxoGgaUmclb3FHUoWwGu
         dcjln+wjqUu+axjbrqA0tCSbOtYf3NIYpiOEW5RWEt2ZEiEg4J4ej49iDUOLVoPQl3QV
         9pnJiRHOzWO+xjy0pANzAQ3oih3N0eVpZch2PfrqBWFOVsUKDBYkQRrN/hXKwsYMxHpe
         xnJEbG1prV9Dqv6On4I0AMJTofKjGw42f/eqpkadrVhPuDlX5clq9PypLFOy8UcVKsH5
         LThA==
X-Forwarded-Encrypted: i=1; AKwUvBzg38My8Qnb0MKVzuP4Kx0GniXTYl3iF1vww0iNzK/2/jQHqibTcyXcnsQ8RZDj+MLxXQnD107S3F42+sgtSho=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pqKGy9xkKZzaji9o+9IyTUwqflifIUdN3hlqihMqtibBKdFGT
	PPAes9SBtlyZ7heZBt93jNZeqx8uJIgVI9mzlgJtqy7uD/+QvMURo7i48dczDzFEKd0=
X-Gm-Gg: AYBFou0B5nwC0m6XnbHujwHiLA+ZpnSexb+T7M5dWOnLT0X9Qy2/2CK18ECugJYCuVi
	CoF5ItDhfMIDkKdu+gKg2Vx1jaq7C8fviMbofjAs/V7qA5jSxFGl4BHWLBVbQTRz/nNvpVU+6rL
	Q/XBxPYU01vXqbHW8jcQsSoSgz9aNO7Wd+UtuXfScXXyg5i/VsRyhUUwRH4xoY7zwsbGouBxWeX
	5p2Fc6fryBhsgtU1IZMfs2mmoOWGtWxQE39ry7Me9LMndM+mtclGXz8LNYTY0TmuSTXBoYofTjj
	W4z9kOaTBchwlEXPEVM2st3hyNrIu+yenykJzJEMqSjCdscUzN/uAoFqcgDVVSgQQOmUFLoNX/g
	Y4P8urDYkqcMnKxQvVa7PIWemZoSeMDhjePNd46/LCLu2FoGVMomSFPx5HqdUeET+ZSTN4XrSaO
	QZXjlwGJ9fEY4LnWG/07fNqQgqW84OOB6/SEKxOU6k5SXnj0MfOWwnEpl5VPeg0jM3vjIBjMtUv
	ViMBTrGH1sKx1UEyFqaJZQFktBx3a2hy5L9ReaBC1GEKNA3Q/j7PBwaBxm2HK3XjIla7CQ5X1+H
	DVZfqTwnDhcf0XlVD3fF
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae897f3919mr15959327a91.28.1793851529190;
        Wed, 04 Nov 2026 20:05:29 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm952109a91.7.2026.11.04.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:05:28 -0800 (PST)
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
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 20:05:26 -0800
Message-ID: <20261105040526.26323-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-5-romain.tisserand@gmail.com>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com>
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

> As on stock,
> the panel is set to the 18 bpp interface pixel format while the DSI link
> carries RGB888, so the panel shows 6 bits per color.

Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to 
display at 6bpc; the datasheet doesn't establish that causality. 
I think COLMOD only applies to DPI and DBI, not DSI. The initialization 
sequence can remain unchanged. Non-blocking.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
