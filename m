Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68DA33B975
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 01:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002616; cv=none; b=u4CT7mWVHharHwUNYp+mtpkNUAeTSrNz5EpBm8qCAM2Yhyb+vpR4ZlXR+EqP3JYzLhAa4c9ebhWe3LRfm6/rxnJVl8d/2ogVlKkjcdvJcKqRh/AfeecqQY6BTbE0SuA3s7MwMW2AaX0L7EAI4kMdlRNP53vIG6zN+M5Y7SABMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002616; c=relaxed/simple;
	bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brFCKirFW5SJ/QORnMSQp0UFkdeWCcPj+1P1TsPXSjdqqM4abIsoV6lecXeawDiyuBUTZo+OcwcX/U/xXDWUK8Vot9bauGg6zFpZ5/lHF/DGg+6eIFTWNV6BHXcbjDVv7xskEzq1i4inVw+tiQbAgtL69BIS2w9iWgVXJv4X/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjT1yY5h; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjT1yY5h"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39675172593so5498008a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 18:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002609; x=1789607409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
        b=mjT1yY5h/qRXPs4DN2RxA0lwFxzx6n3yCOomKv8RBTYRPYHapn2utDuvL/mE5eANsC
         BKbfztcsRdaTMt1fmKhmiDXxeL90CFAH/hx7a479rXQwYgKae+H74HOrPb076S8x/mXq
         zAtiGakbHLz53SwUx9LwuL6Km0hnToTeq4ingCFu+fBzHrHwVa/8P2EdjMiqVeC4SwZ9
         upqQca4pR1Eek3D/TaxdZACKloybZD1usKb/j7w1+SF0w1s6ZEeoqqcqa3LGk39/FL8l
         tAX6UCyRbWGu2gWCZaTgi4smdbnOFbewxlEoAIaLSmhlF74bNQHjxpiIphifX70vtmq/
         Z+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002609; x=1789607409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
        b=MqtwjrAlyhZbKfJd8y9Qye5lbKOZUlihLVXjZt8rWDfOMwvXwyMiPmEE0e/8KpngNQ
         2KrthukfFx2ZuiqocTrVM2QwvIj47+AAogwlLjpBlQf0VIfQPAVjmL8smsLxCdsVbprG
         CvZF3ryJl7SMiwqG+eDioa5xer+SCOWlCqslr09XeINbiidLyeNRQpTxN+f784Rp4bhN
         sBAHsC587q7YDHHRxGGDP/HnDuAllhCIpTMlNyldkFn+UlwsCTVaCK6USxpXRdSPXUZB
         VtQ+d2c3IFZnXXsr6Y6SKBiGQi1Lygvf8Gb85Z/Mvf63FOs0jGhhHBdJFvXXgNfmUaST
         Zqbw==
X-Forwarded-Encrypted: i=1; AKwUvBxyI/A1CUJtUywQ1ZkcgTo9VRYtxcpMbHnVOeJEKA5Hh5sLcRmXCZ2SYNRLIWoQk0KmR5SQNIHDLVKt8PBgqOM=@lists.linux.dev
X-Gm-Message-State: AFuF++k8ChpTSBS/GDuSVyPG1iM89wI9yJZhVjibbGsHWHHKb8xhtXav
	TaAyjlm28gl/eTa+ezgZhO9bGThq50OpAgCRscrSDodnoseg5MO8LlE=
X-Gm-Gg: AYBFou0tWCN9XKtcv0n9tCpFgdxA9hrzX2QIDirdsjZScmDSSzaU8P9wbg5UjrxHV2y
	EafnL4sF/7YghQzts9z4SDzA6cpyYKjBQpX3dS14UDF9Pm3mr5bhn0DSU0UBLE1rHtAM6f0yF4d
	v4MRVe+DCD+Kqrhn1IUOcrM0bO2fC8Dgw1SQFDgEYbAt93irsWYnbF6mfjpgbLdnB5q2zAb8CYi
	2idjJ+jocVnB2qLwxv5xwF7q+wdtFlZ73BPqzd7LJKPKlFTwAYHmOd0x+gcP/7YrElz4oilUHOi
	uFrbbTgWe10q4DtYo/1TZGP0D+NTf0+cb4vy7ftYhzt0/BJFkIz5pNzmwJYnTSJILVdILGO5AqB
	w1bYmcSSgWaa4+AGOFR4lWaqbhvBlFx4dUMEIUYNL9EJT+sC8GvKVM91y2ggi7x7yksaYOErHte
	06e0uUTsS1iiDZ/P+sY3Kun/TthAaGHq1bbYaT1JdJ2T36jldfir2RRFESNSK7osX+cSpDnBM/0
	IUKuXS4+mfrQFBPc53uos/5Hg==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr36753936a91.6.1789002609041;
        Wed, 09 Sep 2026 18:10:09 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e7f4369sm863377a91.8.2026.09.09.18.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:10:08 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: free the var ref when its initialization fails
Date: Thu, 10 Sep 2026 10:10:03 +0900
Message-ID: <20260910011003.532262-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906133352.3815019-1-donggeunyoo.kernel@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sashiko AI reviewer reported this bug before I sent the fix, in its
review of "tracing: hist: free var refs regardless of how often they are
referenced". The patch should carry:

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/linux-trace-kernel/20260906125025.711111F00A3A@smtp.kernel.org/

No change to the patch itself.

Thanks,
Donggeun
