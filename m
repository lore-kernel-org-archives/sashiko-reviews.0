Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245554734C4
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826435; cv=none; b=gbos/fddU53qsONEyv8Pv9fHVxJkg2/IE9DQX5kJBtlTuPxdB1/+kxGD3OJiNyxpybZDapuDYC/zyYot4cULRU3/+fzQ4yOyNzjEqkurSedJbZbfeyDaXQ5OozbC1iXEXcZOVec0M/BTEHoTtgh/Yk9HHQJ2uowJtpbGFjDHRMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826435; c=relaxed/simple;
	bh=9BGi4xPmEW1kSjxVW00UAzBCZsYKa/tallJYYlIDz/E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=FxiBMa8v0+LBHhedbx9yiW/ZlrekqtSA66J9hEiJfRem0aSJaifXPUUNsFTCBanOjYUEyebkIk7AVEhZ14SH/dRnHk0IIAVfbktEFTJuimZhKublJaI4XunJ+CWROXJS+9HYUETF0yXT0jZ0OdXzaXPeamVaj895CPDt41ECbfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=dkKlC90Y; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="dkKlC90Y"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e7109321dso646158a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784826425; x=1785431225; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+ctXvaIYkWeE2h8F1u4b7HT7VEBp0edXmBTu/xkC8k=;
        b=dkKlC90Y++pLPFispEUHpJFwriOIa9tLZHg1kbUqVCGY4EG7JPosAd42ms+lLLm+UC
         Kb4cLYl4gQnXQy2gKSYliPY9FMxt4MMLc2wQRGH5txvnkFyPDL5SptoCoK3u8Aw0+dWu
         16G7KFU+MW5Kq18ekgaWXN62YHqYIFm2UQYl3rdC63XXtwPdRGpR2PJ9UkgVvJAE1TXf
         GfnY/9V/E/DxdRZ9aeGmyQhnnO02lBjjjno+2rz5hBM+Rk2TwL4II/L6S81opJ7czYIg
         TuBijLzOkyI4IKFz9fZx6LJoE3LgjWtrofJvCh8vJYERUmxZfBjUKZk564p8JcSmqrMC
         t8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826425; x=1785431225;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+ctXvaIYkWeE2h8F1u4b7HT7VEBp0edXmBTu/xkC8k=;
        b=HJSIa0lgNIG/smm8TBaUDvYtvGGSV+N/jEqu+PDjQjeNXWobngxXFn/Uj9zxZ8588x
         vkUNIMvGWhr6KOoTSzUGNw7LHmJQ3bU8gGbYHjIZLHDZDz1ibQq8AYOAPg2fIPVOojoQ
         04aOy7xtn1t5lptQkXtYDK7KWh4VaW61jcXDdpXTce2S/W60XV5hbbrosrl/ksmb+dR5
         zzjzyDCCFkw1ER1z/KkckAebC/U2uzoM4flPFgRHO/Ql4WhXpfzdHSYsiarwEqgrUDYn
         4HDBNIc9dsySUJaXpQuT5tRBmqtXD78+JuRb/KzcJzCMZ/ucR/ngO0/qFSHIAevQhRja
         2ZoQ==
X-Gm-Message-State: AOJu0Yy7KahJw1v1QcOJJHrS8CBBfW8w75xGaJPERb7ZQAk+7lLEdmTu
	6I+mCswWrxNepV4elJe9yweONFllzzmE+tOe68mGn/11Ojo2L2QMIaRBUsCkMKwSUuRnICEmZyN
	VtbYzj0E=
X-Gm-Gg: AR+sD106jDIfgii+gIejqRYjAdUWagJfRcU6MjrOOPxchSa+zOCSDei3gVpu9UQkWHB
	Bkzecwm8mMKmnIU7uEeAPZrtRIl8iZxESDQbl1NbOjYE6M3b3XhGMhNV3dujk0NmIhBgRB4ZgwP
	TIt4wabCx6QQ6q97Y2X2CarMJkCAr38ChgZfaHgMHXt2EwODYYGYXjD7tHSxC8EuKmoA0TLeX4H
	XEHEtmVFnWfqgoEz5ZwFdAo9i7bvs+EZQBxN0IKJ4DqsXzjhuZrFitsemmIGjvYNp3iLj5uW1K/
	DbdzpqnbVf0GU6+uB4GKpF1MACQEV+tO3CjcDcy1es2rVOrOGVlpiGLlcejWBtxRkPbWYuqGDms
	jZh0AqkXqhiJuzy+lZEI4KwulX2oPm+9KHCIQAyyhfppxoHlKglrV+dJHOtUtWbKk/bW6WmFQfO
	4/3A==
X-Received: by 2002:a17:90b:568b:b0:38e:7d77:2fbb with SMTP id 98e67ed59e1d1-38ec6631f60mr4017014a91.32.1784826425522;
        Thu, 23 Jul 2026 10:07:05 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm170294a91.14.2026.07.23.10.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:07:04 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:07:04 -0700
Message-Id: <DK645VUA7PK6.1B2M1Z5TGWRB2@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/9] of/overlay: don't create "//" paths for
 fragments targeting the root
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260723033553.1261D1F000E9@smtp.kernel.org>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-6-2abe2bb9cdbc@nexthop.ai> <20260723033553.1261D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue Jul 22, 2026 at 8:35 PM PDT, sashiko-bot wrote:
> [Severity: Medium]
> When path_tail_len is 0 (i.e. a symbol referencing the root of a
> root-targeted overlay fragment), wouldn't unconditionally clearing
> target_path_len result in an invalid empty string "" instead of a valid
> path?
>
> If path_tail is empty, should we preserve the root "/" target?

Right, a symbol for the __overlay__ node itself of a root-targeted
fragment would come out empty instead of "/". The next revision keeps
the target path when the tail is empty:

	if (target_path_len =3D=3D 1 && target_path[0] =3D=3D '/' && path_tail_len=
)
		target_path_len =3D 0;

The other two findings are pre-existing and tracked in the cover
letter's open items.

Thanks,
Abdurrahman
