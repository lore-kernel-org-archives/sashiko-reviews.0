Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592256;
	b=TWSbze9LBVMBmov+GOZn0Bb0g9W1qUJdusjyw32uWAndJ6pr40/EKhOhpbSFwg+lmQcr
	 juvIJrpbrzyhQfOdn8Pvh1nvWMpv1vTotcD/wz5Q1GTBvEBTxgfiUzi29U2ova2pb4RW2
	 8PVfO7Tm/O/6q76Ast7NJJ+KbOfiIeWDDCFeWJYLwBwfV4HZEG5UKrv/D+qQ013csI2T+
	 WJo1mhUrpF4RmZsN+pgTp33PJEXMqxkWjpslZwJ9M6tpWjWnYk3HZ3ioTbnG+rP2MG9ZH
	 yDeW0RSmxW3K1v+KSV1W3IyNLtm/0HvEgenpPgVtzdNon+oD1RpvGnDdToqI7NvRYbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Content-Type:Mime-Version:Subject:In-Reply-To:
	 Date:Cc:Reply-To:Content-Transfer-Encoding:Message-Id:References:To:
	 X-Mailer;
	bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
	b=AqH4cLxHQ5Ggx677Ua9Ak54VxbQCKaqBapUvtNu30v+3gwWHh4gqDZBrYGunXoTQHUr2
	 zZIZPmR+A9XUWnul5pBREjGvMfNAfruewirJ6obVKQPnqN2xFo+asMZRj8frxjUOhh4Be
	 HcG/oG8SlE1S3z3JawpbIHG9kZw0agm2Dz11oc5/3GsCftEgN+Oj5hWWXbf++hjX2cvwU
	 PgRwW0M+4Z3530/ZQ+J29sVKG5eKG7LIQdJQ2uek6yOYjeDJ5IEOQQrx4zjhTMmAeMKLi
	 NfeNNspMIci2qNb6Wa3reivOS0rqs13J456c094STNCq0ARQozgoWSZ5MZsIc0pOzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c3Ru178/";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15394606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 14:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15394606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3Ru178/
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so6521511fa.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592254; x=1793197054; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
        b=c3Ru178/VJywwADpIGn2V+Ydugg27qXS5zqjV7BHtr8d9RrbXwxsS0aEqsuVfDBZoT
         YcYCYnkpcSxBvyRoWxF4mTNKVr90+Y+sWdO+NnazUfOLZmnIQmJsxEIypQamt+ERU1Rs
         20iPe8HpDQkDp3mDxBhwkPiPM8y47fSkgcwi/LxQk+qhN+quwp6As6+JF9/+x6EkTw9g
         tR5VbMALWGDZ0ED5XOeTxfUYmWMkWQdGcVrIGk4VK9N3EbKkxSW9uoTLIgM9urS4jYfH
         RtsrXObvHlafH37RPepuIBy5bG8/uwrmz01CmA1gMGubfbN9f7yY9CHn3jrCLlYWvJhF
         VXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592254; x=1793197054;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
        b=L8mY8j0k/HXAskLTxdajcgdsyQyV/gGnJdvrE4e2bVR+aG6RmxItip6rMzbbo6T7i5
         BW60TYqGt2y4G3Zqvc61eRRYmoEUGAIjQohkGYjXQxzuXrJH2LRANMb7PCnXQcyqDA1O
         3SO9VB8k3NBrM+XCXowG+vXzTe/0eA74D2xUnhRi39bTtADHnjaVqUgVqHwxhlpE6R1+
         6cNwirdKjz9jouDJfMDe4GKegoTX1Vw0qQHzmDAnRyRujUBARv5SCbcjV25Ji2uvsglF
         WjN/pfRspgv+QJCl7NOdZWTKbMs5Z4VZXmD95DGW/i86/boYWmUJcBxZWKMPeCHF+NLi
         ng/Q==
X-Gm-Message-State: AFq9FYL8H/zce0/ov1Bs/4xpRP0rT4sNbWUZNLgjSx7o+R3IU6eX0pO6
	7EnZ7c3Drk16KAugKvObqj/zHqHcdd+w807QWo7xforXKIXsWx6W4L5ALUQmjZqxyFUtI9zg
X-Gm-Gg: AYBFou17eZ7u+tGpPd438194FJV3DIo4ePT37gVBbT62wzEEyYkIoIGPTMhwFneBDjv
	OtHFAqbP1DfKDMjauF1bI2dGjHfdrt4cvG/8WlRysqVsZCQJn3HX/u8HE9PAEb1jhkOx9xIgKzA
	RI0nZ4sHk9qAccw2UmQ4jr79cvZZ0woQRxAWHHlIVraUQ9Q7up8YgdQYYPvLVt1K7Ru1Wx61Ib9
	FlGyy220U+bvnlcGS6o3AlZscELuSvHnivmRbGsh7Vqxo589rKoGTf5WrpAI5eeF2E3YOQghI4k
	W3MliyggaZdPzIXgczSOoa+KCCaH62CvriDz85wEy2QT0VR7/YR6PjIzYB5dHeaCczn2rmQeplH
	Uln4cCmvNjn+CSS4NV0RtD+QR5r5Gbyljbp5iRtPHSZDbFTU5g/jFTSwtAfMrKVRExOT/NiYtq6
	FtranKUeErRq7j4VwfT9zix4ySTd9V6QmpQIhzsq9skSoWkQONQ09BpDvrKkWMjX0QWKLmoBuX7
	16efKnWetYNIxjUdWHc4M8zJ3fo+tLtHzxg9RtEE7xIGeWhk6l/YLPxTBsdoP/lENudGTPRrmcN
	yQ==
X-Received: by 2002:a05:651c:a20c:10b0:3a9:9a60:2c47 with SMTP id 38308e7fff4ca-3ac441c1e28mr5511751fa.29.1792592254112;
        Wed, 21 Oct 2026 07:17:34 -0700 (PDT)
Received: from smtpclient.apple ([176.99.99.239])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563b1asm169111fa.17.2026.10.21.07.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:17:33 -0700 (PDT)
From: "=?utf-8?B?0JTQvNC40YLRgNC40Lkg0JrQsNC90LTRi9Cx0LrQsA==?=" <d.kandybka@gmail.com>
X-Google-Original-From: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JrQsNC90LTRi9Cx0LrQsA==?= <D.Kandybka@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with
 debug info
In-Reply-To: <20261017214129.GA404142@ax162>
Date: Wed, 21 Oct 2026 17:17:16 +0300
Cc: sashiko-reviews@lists.linux.dev,
 Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org
Reply-To: 20261017214129.GA404142@ax162
Content-Transfer-Encoding: 7bit
Message-Id: <72D78195-967D-4789-92C2-2521195D9454@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
 <20261015210149.78470-1-d.kandybka@gmail.com>
 <sashiko-outbox-174936@kernel.org> <20261017214129.GA404142@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.3)


> On 18 Oct 2026, at 00:41, Nathan Chancellor <nathan@kernel.org> wrote:
> 
> This definitely feels a little contrived but anchoring at the beginning
> would avoid this and seems to match the rest of the macro.
> 
>  s:^->BLANK()::p;}'

Thank you for better view on this patch. I agree with your correction.

--
best regards,
Dmitry

