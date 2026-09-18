Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D04A2041
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720687; cv=none; b=nuq2geFF8MPFAisy/Qlxgx1TEXL7Kjxjyu4N0iOczW+7XP1DSakbTEFIKAT/GRJAE+oaz2FxF6qsLh0/TLfThUXTTWY9riKxgtLrUTUtQ52OACNAPUEyhhYGZpmnC/BjlrcUppFNSgrGe4pdYsllMKZ4ta2KU2LHQ/QyXWm4KjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720687; c=relaxed/simple;
	bh=nyiGRPw84v9lwfjRJbd1/D/bHlTM+QmFadF6+0EwGrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQNIayAbXGwdAGXbwRqPg938Ks/VvPoAj7KYhOFBIENQEICA2kNiy/7bY2qMpKsl+rGO/zZ1b9jF2o1u5HiG3BcTGoaJZjjiUzvrXmznFy9b3WKn2ikohUbWXJQ54q9A1h6S7fgl5rEHbaW8ObfPatMbaduaqOOLwZlEIIYfnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISxhYBp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISxhYBp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB201F0089B
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789720684;
	bh=nyiGRPw84v9lwfjRJbd1/D/bHlTM+QmFadF6+0EwGrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ISxhYBp1XjUPTOU/33vfrOxuZC2d+Q3kQjhykcWkGm0JQKT0adQpFRvlvW8SwS8ZR
	 2VsPlaocRTemgEkbHMu6GfSY0PrSXICnmxaH260WiYwzLX4WBl7HqEI6eJUJKNR1cN
	 31JHAu7/BLF1F4DDFSdgmFl7QJ/GezoH1vaQPj52y/ym/5nuQwvnrJsnJP19tYGSeL
	 QYyHR8eh7dmUX17Vn5O4MKnklpiMijnQhjDCut6yyiDgU7vQYzhCXrI2ggJb4nHiS/
	 24R/SjHy5h8/uXcQMQCphmykjtct3v5vIuvNRk+81EzT7eDutZOt95kkjGbryp/2i0
	 9fWtDQbQaNruw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so419203e87.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 01:38:04 -0700 (PDT)
X-Gm-Message-State: AFuF++lsmp3UE3bjA4ITXSOrR1+QdEbOMy30Qf0Jk5ArF3jbBKY5QFXZ
	NnZPOMgD6wAhmYbv7iU/Ki4jouS5yrYrBhA68DYAWnq+Y6KCsUTzwxHTIWFfmL0RpAF/bSHEF3j
	W7kSgBRRiuoNTcZKKghI9CMF5vmOD1/A=
X-Received: by 2002:a05:6512:110a:b0:5ae:b259:75a1 with SMTP id
 2adb3069b0e04-5b8c17ee5c7mr468241e87.12.1789720683033; Fri, 18 Sep 2026
 01:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-7-88d29416e3c3@kernel.org> <20260917230646.AFDD81F000FF@smtp.kernel.org>
In-Reply-To: <20260917230646.AFDD81F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 10:37:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBKhM9S2bG9ttiA0R7jqriQPH2SHRGvMWq1XzkTMc5zw@mail.gmail.com>
X-Gm-Features: AcwNN1UCI8p1qU45iM7QZFxLwNfb4MbT_iNZnqOGLT43rWanvJTWkfzEs5ZfrgY
Message-ID: <CAD++jLkBKhM9S2bG9ttiA0R7jqriQPH2SHRGvMWq1XzkTMc5zw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ARM: dts: ux500: Convert HREF audio to audio-graph-card2
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] sound: ux500: hardcoded TDM slots break dynamic channel support
> - [High] sound: ux500: ABI regression causing loss of DAPM pin switches

Nobody cares.

The old code was not working.

Yours,
Linus Walleij
