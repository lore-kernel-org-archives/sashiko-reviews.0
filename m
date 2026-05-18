Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF82EA468
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120789; cv=none; b=dTiqN95dBTNuZpGlBgZMUtEtp+zPjG0Gnst1ODaP7gP3zu794VYFV/B9D25woqq5wmkbqm3s2sI4MjuzTNaPCos/EJt3jpNtNgdPd2UQ5qEp/Pcfp7uDNKkooUZ8ZTcmqFJEcJ8XqpzGfCH40lf22SI6FfHEixnFtXLtawugYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120789; c=relaxed/simple;
	bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jsCN7sZAc87ZZ4RRATKhRo/OMswqZ/dPOZwJTElaYczhPtKsc5OEI1TBc7w9B4JbTNEZiWNHdh9J1vqCkZ152L1+XoLiKGMpjHgTFcbmhuUBGJ2T/K20CLs6qDYh/H4GiAdD00h5B4uVldKvVtN8ti3Yi4AV8pVyInbBZUbRLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOMHaWIH; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOMHaWIH"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-479e6bc357eso845628b6e.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120776; x=1779725576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
        b=SOMHaWIHY9jTGY42DHBOcyWto6dW9ZMm+yYpAEC/vmQ5CXMg+Phcv49jviwtzUi8Bi
         b2UnMbHy1pg6+BG2HAIR+5xp8yAA4LDt/HPCS8I+kellWJHVFaZgV1+TqMURP33cNI8Q
         nwbsY55C6JvSWggPq+ZYRWExSQzHsATXWJZzF8734B7IRninw7dlIrMSlKbQpL1gnzkt
         VscS+SibCMGWPFBuFy++0gwmUstKaL0gSe10cM5SaWtkG0V3Dd+SFPeJw1XdKj8BRs6W
         6nRavYWTh3OIxKUH4I7ERkB3s061N4qDIQP1yg6MaAHziu+jE1veJMifY/RYtXNeZsm1
         Q3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120776; x=1779725576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPH3UHYA7l8VRAO21OcMYyZqTzp2i6IfDEbVAUhWAfY=;
        b=JoNJCYpFnZvF7PiMVr1jxL22LPKp1REzsX0dyZiu12/EwOa7dXAJ9eVpx+tzfI2QUm
         eJcw5I52xYOZ5Qc5diyPF/6z+p8WSD3V9Lhn9SGyzo2LOid6pHDzzWbxeGAoQyNQiEDL
         q+g54q3kWL54jFZ6ESjOah1pppdNrKCw/l2Wzb87vHSklnmirVVDeSIgiaPQxqTou098
         Jym16WiduV5P9MVYJGawGEyMUP7XR7MBtedXPmBIgSqui0jkWpSZ3s9Sk3Kzond8kfz0
         NzAdVjezhIJ/V73VQV4TkFtcYoEpZ6LXpq6RG+a+TqFSqM8Ct7L/BZQPJZGEjQiz+ibW
         i92g==
X-Forwarded-Encrypted: i=1; AFNElJ92v/Uxs5KcDThgVn0+QiU2/j3eYv+MtSwZjQXLkOAUFkd0H4tW7u0Mg+YNLYna9yVmwYQEv0h5MzLwtG2hDFY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgnQLMHheo8vvN7vGMM4z0hG8AKXd72Ujz8hDKCx2V8mvnJnID
	fEtdPQ8ketc1/Hhu8WzHYNpLmsPOH/KS85IulwtPYhh3BNozCGMuxUia
X-Gm-Gg: Acq92OGOyUZ6L4pAbqGUbeCn6AE7IYlUNNk+jT7Sq85K3fUemCnl0Xwc4AmQMQxhajb
	Q1dBSoFW0m+o+3RBrQKVxzkfPN8134iZWq8/keHqDcaKtpio+WAxZhdtYXbS2nPTfGl4uVn8ZEU
	YIaqOXN5jPJiMceMDBu4kUqHNF9sl+OPGFC1Qcg0kzhgOkcI3CD2hV4Ev97ye7ztbJOvqlrghrO
	dZTmmOofYjg2vWvaSmTvH4yJw3r2xgodSxZLfdtOC07eglXjqdtGBqme42GhzbaMmgBj/dDGm1n
	NgdD5939tSiCafuQyPli21F6mLwR+GQ//sGJj8EHlIQLDjYwA5i1kM3bT14eo+zxguDvPjrRl+P
	G9+tBORtXaypEt7PV9n4oOi2xktunutNkacEDsQyNjeOP6IgMZ2zSyk6jjpMVaabWqZg5UoY2eF
	yo/Feh206x8iSX6u5dFVnesWC2t/0Gaz5rdjS6oY1h0+ojzJqdizfbso/bqouy1dXY
X-Received: by 2002:a05:6808:e693:b0:47c:6c99:f20d with SMTP id 5614622812f47-482e57ad3bemr7154228b6e.40.1779120776293;
        Mon, 18 May 2026 09:12:56 -0700 (PDT)
Received: from Dell.cheetah-searobin.ts.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee531c50sm5244120b6e.14.2026.05.18.09.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:12:54 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-bot@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 11:12:48 -0500
Message-ID: <20260518161253.21655-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518144521.0A681C2BCB7@smtp.kernel.org>
References: <20260518144521.0A681C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Is this port node indented correctly in the example?
>
> It looks like the 10-space indentation places it inside the connector node
> rather than as a top-level property of the rt1711h@4e node as intended by
> the schema update.
>
> Should it be aligned with fewer spaces to be a sibling of the connector node
> instead?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518142901.1747-1-akash.sukhavasi@gmail.com?part=2

Thanks for catching this. The port node was incorrectly nested inside
the connector, moved it to be a sibling and fixed the indentation.

Will send v2.
