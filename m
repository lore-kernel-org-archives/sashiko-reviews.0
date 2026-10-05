Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342014349A8
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191559; cv=none; b=P9L0T+9IbBDDsVSXtlmqAFsHHfMZNYfp5ZSlyzUHNzGuhxT4EBxS++aDnyTSiSfVzovXYh27RNz+HRrjX8P/cIrVDlHin9ISEmphgo4tiHhSjBGqTX1pcUBzGjgbCZ1j/h7n3e902YbB1oQIlqfiUvVvtEaBnCDDzZE/jWJkOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191559; c=relaxed/simple;
	bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F6ojt5+M7ZBVZ1IxOpWnLvTuEuJSnPsS6UQ9RSnj5LeDfPZ8zDAncsJMFhlYGi1ovCc15AjDbKcAS9r51EUbI2KKajEQSEybTPLJn3YBrfflLVMDwI+WRUxaoA6+PQ7mbv1/z+0RVVqgV/TWNmCc4IVTuoS04ATHQsZAzO6gQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c2z5RcD8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c2z5RcD8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so10060885e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791191556; x=1791796356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=c2z5RcD8X8wKY/m2lNxW5r1r45HP5E3BoBgNWOO1SLMLcf9IMWtP1lR9qZtTD8vftp
         IsGKFcjtc4w1z9oXZH9qICyDQBgsuMAdOfooV89+MXZEwUbL87OtFOPsZ/J8jADWNp+E
         tx0NzxYktlOgkxdV+40PxM5brGuN3ugVdQFdJImmfDMeL8FlkM12bWL9CvcEMuIHxKZC
         IJYrhVkoduFoHQQWBbVtn14Rek+tGSg3O0DLk3OWTLhE85a8wbDyCmQqPdEFp44HxJDl
         ZcgOwdslXYb9o8Uz2bVzKNbvcAIzNWBuAcdimCPH+FlcXT3upiVNrDKCT3OXmIfcHUPz
         J+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191556; x=1791796356;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=yH6KEx9l7hhqe5aCTFVe05tqV00IywwN0p8sfX1udPhOPhrAfLs5N8XcdqblXmTt0r
         CMDHvjawM77XV0NlvcySRK1dwJVWjjjimivQtjl6zqJ+gHT7nPXTasXx6l5vRMeAkFcg
         dX1JAE5NPE45xqwAaEdB48G/zDT/pL/Q3lCJGV9JsLl+B9T/aL4E3b7xM6SF97pzm3Dc
         l7Invzoom1sy3BRgBAbA2jqFW/lJPni+widE0cqBpR3ufzG5u/M0xJn2pwG5FZS9rhi1
         snOuEw6BKXAffLd5/HtK+3XRvhLQvbcjyf0C5SnIJulrLcrjt85scRlvYDGnSra7O/ed
         Pz5Q==
X-Gm-Message-State: AFuF++kNhHA0h4mKANxWGI77fuBbNcR8l2/jizR+Op9S9VrR0gTo5EDf
	ajGvAqdCxGeQSbYNVSGJK1/NJ8eOU2PdZxyZcrcwxHp87KxxUzER24WQE+Yd7SaS+oM=
X-Gm-Gg: AYBFou0aMFzwZKYuC69DyKTjC2BZQQJMlXY6ewSjXtIPMPnLYPI79Y7lH2kJtc6bR86
	ayW+gmfOcelsZM2mCwaD9hgagoBxT233fUlBPrnAumfxmv9ZgfQIZesqb8yckyjOKyy457T24Go
	03TcIEtneuYpkonWD7q6eSVJwMT9c6XOahGbApUMiAgth0pq6r+r7v7zT9ZPGhA7t7dY1G6wSVH
	KJ1i0kw+vOg5+zBat7sxun+H/GoF+EC4MgU06wGSoNPNxSpvsZQJbvUReNUhUBiLkQ4zZ9GrJvl
	KeV7z9IZ4uRYnxtJCiqVQq1WfAsxJUtfHjtzektx+0HIGtsojZ0zIf7KQRqi6QbijMuUpktXKZ+
	qWSeqD1+uNNE93ZbtNNUjFLpBwiFjJVHBLh5/ZwbOBmMRgjR/X79e8Xw2hxQQkCpBSjm9Hi17vP
	UsxAReHUez/h6MX0TUyNCV4PT82CELbMuylNyHCWfMSYgVfe9IPLaHfRLWz1ePdLqYtdxW8izCi
	MizevG/IiPYvvdO
X-Received: by 2002:a05:600c:1394:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a02759dc21mr185147705e9.31.1791191556536;
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm205138945e9.4.2026.10.05.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <87zewti2pf.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
Date: Mon, 05 Oct 2026 11:12:35 +0200
Message-ID: <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:

> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
>> during probe
>
> There is a single clock controller. Should never be a problem. I can
> certainly move it in to more local scope if someone asks, but it's not
> practically needed.

I may be missing something key here but why is not in your defined
indexes like the rest of the clocks ?=20

>
> Thanks,
> Miqu=C3=A8l
>

--=20
Jerome
