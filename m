Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09754E533D
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680259; cv=none; b=WyPVABaBpEhVOz61Tb5rRWeqkm0lXmz8l2Tkplheuq6MxoZKsQoRdlX/h23D0vi4sUTj8tKeKEReUjZL1EScK7NVm1q2Iyr6xcHm3VRVU860h8+b+ocXau0s4r65lKv2UvzGDZXPOM4VoXiPLY8xU+mHlfe7/8ybyBPqBRyGvFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680259; c=relaxed/simple;
	bh=yeJFug6gkic7woaPxq2ZQEvpKqSnp3yUz8Elytgpo4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVYEExchqdBdQcp1Waz5zVkthzFVU0tqckYbXAm6WtwRTeOHQLR8OSRaWSvBHMSUX7DhoOGJx/sA5gptpTaGpDNItm0wvGrAHpyzwm5ROfmDutvp5iRjrDriFIGZEgoANAaKkCTRU6eO2pDw+0+VQKQCUVhhRCHV0Up//rs9NBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQSV1CZc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQSV1CZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7001F00893
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680257;
	bh=yeJFug6gkic7woaPxq2ZQEvpKqSnp3yUz8Elytgpo4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QQSV1CZcqjvQLrK7nCGLXav82UWr4TeEbU6zRhnjxKjNBKRpFgHZu8LojI4ZbTAga
	 3tHGAw9Aks28p1/+shUuMk4im8+5++M7yXwx2lbczCxPkN4ia16gzAyMJeowJnnyJd
	 JzUgTCzfhEsm8d3SMABqHN/HHM4uivCqjoyp3XzZFQC8DkiHO/oLsaC/hw9lCjDKTv
	 a+i8QpLTue2e3jU7Q/ogQFscL1TgBFsh+y155o5GJlk+VfHI6oAQ6Lwh26M3ROv42n
	 XZv2EIdJ4veBpUDLrlcpRgk/6av3W4MxGrPOSFuWnxxwLhKXQ8DZBDu6YSQKPlKBvy
	 NUZv2mVIKCeSg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so116041e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 14:24:17 -0700 (PDT)
X-Gm-Message-State: AFuF++lxstmJWFW4EbdJRHcwN03EhA2wc7mMwzGrmGqWuxi5oQwClznN
	QyNphUx65RBLpFegFuoohmwzUzcRnw88Ruem+n0wL6zyz8dwafblYo6JtMAh2ZA5hRlDhUGMDBn
	6w0nw978q7pCCc2GqCqUyAUu1m/aBuW0=
X-Received: by 2002:a05:6512:1392:b0:5b6:1a7c:33 with SMTP id
 2adb3069b0e04-5b8c19561bdmr51127e87.54.1789680256230; Thu, 17 Sep 2026
 14:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-ks8995-to-ksz8-v15-0-8825ff5fd4be@kernel.org>
 <20260916-ks8995-to-ksz8-v15-3-8825ff5fd4be@kernel.org> <20260917102122.46EF41F000FF@smtp.kernel.org>
In-Reply-To: <20260917102122.46EF41F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 17 Sep 2026 23:24:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY8XLNMYn7608V5QurQkhaGgmr2vQ3EsgebM89bHhjpg@mail.gmail.com>
X-Gm-Features: AcwNN1V6AeB1aYjqtqvZMhT4qTUxCKgsjbirQ8GDWjJVud2nmjOM7Wo85LbpB6M
Message-ID: <CAD++jLmY8XLNMYn7608V5QurQkhaGgmr2vQ3EsgebM89bHhjpg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does this loop in ksz8_reset_switch() unconditionally include the CPU por=
t?

Yes and it should.

> [Severity: High]
> Could polling this reserved register lead to a permanent timeout?

No and it has been tested.

Yours,
Linus Walleij
