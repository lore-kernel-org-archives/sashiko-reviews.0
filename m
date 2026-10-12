Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0945C6ED
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793741; cv=pass; b=K6g37jyjyHUojQaoC9gYtdF+U+38zBLYi+535vXnvLqOsBo6+DHNfSJ4MlmCqSZ1RvGOeV/yfSc6Iby6SZjr4grRrmfIhvHVXAdytlGcILC2c88Lv987afxQnv+hh52QaD7DX4vWrQJrFfj+XIodK9/fO3J4eaqm+eQjdr0kTUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793741; c=relaxed/simple;
	bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnzfT/qpg6PQusSqnfm3lqPGbSRIwXsequOJAB/431PUyvVkuoLSdPGUIlKuK3QMrn/6FdJp47dBJ5AVI3rFwkUJELEQeK+q9LUjqjdXMMKzLBda9DiV2NzxsC4QJGtiOqBYEFBWZD9U24BHqHsM03uUup9lIfsNsQ7P0C+LcGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQUiU5sT; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQUiU5sT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5fb79ce82so8309735ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 01:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791793740; cv=none;
        d=google.com; s=arc-20260327;
        b=oaOJ3XkfzJGN7r1Y5qPRICJsAXkpLHqCanG0ueB4rLXVSM5iu47GOqnRvAXwp3C1Yz
         kDFi7ab+b8x4HoAdezjSWo0COxmqFvQn+YH1uKIfaSZDi6zcwYbJTfn9+1albuAD9HwO
         jAPs2vqYZQhHgfz8zmIx4ZP8GH+bj+P2C38EwrhkI3HhPuyoXdCUi+hDKREc9Yh0Gqh6
         waMwJp/1TXx3jNdKZ4YVKUEHkDmL7JkaTN7DbcXKLjrvhDNnh80aKsBgWrTLUHKqUizN
         TsSyxPC+NEAxGNedgZHywTobat1HOilHS/Sc+2Za1W57QihM3vfZGekjK0rlEf8lOOXr
         4ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        fh=EPR6CToHK/svwEboqI62tf0N12Tv+rY9pW0Ok7awc/Q=;
        b=lpc7ToWcr+vx5Dyzfeju2VWlpjYI1clcPVmzt4VIRmcOTFUltKETbpTN8uOicadGWU
         KIhFn23LLK3o1u1/K1osvwhH5Hvb5359MCqXhw5i7KEJk2vpi25877qIfvKFNx7unPSK
         kqxMXGVCj7XKiJrn1kZzguY0v27x1IHPDKeVVpyYN3yhh+ZKwDSs0gRrZDMoZt/IYJT0
         VwpKQMGn3KJDVr9FHvWSWsaMHcJGCE2oMNrdXe+xmZWgf6j4DQFbVA6GUwRvtVXKwV9/
         V3OcdcDLATD1fjJ0IRkv5A5c+ulRPR+c9CTHm8BxSiPJ8IaCFHemnVcLSCVhVSiT1Ws3
         nOSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791793740; x=1792398540; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        b=nQUiU5sTe/hFFSbOcXCI3wtgNpHJVsCnbzyDybxYIf70sB908FOICFNQWjx8b37Nwa
         JeEb6LjfkldLhYwGEyF1D+CL78uyd92oqYqdJdNWY3n5IBPm/IvmGWyQ/ifP3mUjssR0
         nQ3NqxdWijCjXmnAWxD52yVDKLePy8cxWrl6obC4pyTrQkXUNLOa2XQ2WZZLtozJH3Dk
         4CTwTNHyynHStiu1HnmkzCrbm2l+SBEiuaSfaQAhfE5ahNSFxsqm/BIicYJDa9uY7gJC
         HWmWCm94vH88UTiksiA0yQ1OUnPEnM+PC/F40IE2D4JDpHkc7MDwRntH+Pomrxdq9U3Z
         iU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793740; x=1792398540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        b=Q+6bDJys5xQ6GjItm/nnjbdDe5Cfa1Nr97jfA2mCJ1Pa0UPw0dmdwHbTxvroTlvgHt
         jlhbAx1ypyQqlIcMEzGSGuuHBbJPxUhlVEEV9cMn3+EzqHuIvUX67b6gbT/UtF8XOq6u
         DtZv/4Ax/4mmiqN5Yq97/0eeR+F7kJ6bBTxOUgqO16CXcatzTMmCcNf30xIkywUZ1ujT
         /LcncXdXWgVCCLtXLTow/UilM5IgRzr11MYMa12QsYr0q4lXIeR2T4khIY9n/7NxLP+g
         4plrA73+Y+sYz4XyKxXy7mgkqURbMGFu2EgaY2w3w8Bs1ibq3ugtfWENgoRrEkS9yMfe
         0SLA==
X-Gm-Message-State: AFq9FYIoljJiGMOPByq+/PrjtOBTWU9BRKNpbxbPWnvccYh0HLuOmEA/
	lC9KpGvBs567E1wMMhmBvGjoWKsJX7XAD27Q71CVSvRci2mIcYeBpHRoFFUr0kLQkM1Iq9TGr6f
	OKwPqflS2SDidjcj1u4xGhAYt13bjZ/Y=
X-Gm-Gg: AYBFou3szCmYYXBnmEAL5IfdHhGmNsGbslO2sSMVGGjvN+es0umcJnRfd9Futz1dImo
	6h/k4cfwrgmLyCCaelpXSNymaInhpEIstNNa05wjXaUVOPqm8AzlreOiI5BvDIi08snFOcCSLC7
	MakXQNV9y1N+M0MmhN/z8hqIxg/bDZVBaMhzs+JTa0pXBiRc1ss3rGHUNDe0Kg6ohKsgrDXbToP
	Khg2blq6jE5WUeU58R5BovyoZb/eBxeE9P5y16Kn1lmRxhU6hGdPXvOT7B/AFeZnZpEx1w1LRt1
	QsfLd5zXWPRFmShflwoVBGoo+Dwrcg8zUSdH5s02BGnvzAI4hq2OytqiKJVpUQB69ARC8BItJuE
	AcD6fLPPjS1ahpPZbzCZ3huvnxniU/8vKArSUAfsPamrO54qJ3V9qEjuIIqyPvR8awtChoLpJJ5
	hUUQ==
X-Received: by 2002:a17:902:d50a:b0:2e6:7c6:8d40 with SMTP id
 d9443c01a7336-2e842bc1199mr76113395ad.27.1791793739705; Mon, 12 Oct 2026
 01:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
 <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com> <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
In-Reply-To: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 15:28:47 +0700
X-Gm-Features: AclHuK_3DwYf2CtnpcS0CNjk7I8fINwJNWL-ttEH9GpUI5_HOF9kpcbbnysw1mQ
Message-ID: <CAABR9nFEOFSeXys8b_Z-9rgpSM3wPq0Nww0anc6uMesijttWoA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: Linus Walleij <linusw@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for confirming.

>
> I don't understand Sashiko's fringe use-case rambling here,
> I think the patch is fine.
>

I'll keep the patch as proposed.

Best regards,
Phuc
