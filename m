Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66D37C91E
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563550; cv=none; b=M/e8g6LOFJE3pi0EEmwDOS4qrk3xvBJhAXUVgLq7lxj8MVUcmbBJFMcj35aRrpxRtcXw2nnMrt/VdbnueuThWrv5BUseWBxuKMxenpcDBfG9AZlllRJVWMKnG99speXP2mrIencpuvd7OdNHC6wyU78kzJS44TNLcdBmDxwnDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563550; c=relaxed/simple;
	bh=8dbErGSnCsEd7rcmSlNju0QE3rK/px6PY+xQAknLbzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3JFhUfE9uJLe6OzT9T8v7Zon3en0P0QCdKXGsNcCsWLScMMKpmoHcXqMiZUdwIEjRGEtHyZIxFUTz4lJNq2/3XMGExvOvL/Q/kXhDHIsdIvt6fdjHWBc18tBHvwyITUBKst7EEATp//pOPFSdSORdjdWwOg73w76VDDWtABw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/gS9zaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/gS9zaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265C11F000FF
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563549;
	bh=8dbErGSnCsEd7rcmSlNju0QE3rK/px6PY+xQAknLbzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l/gS9zaEOgAtW9yOtGQayAh6GjiZk1qifHPy8bv6gm1KpfvMZFcn3kywzG0O2XX4O
	 GoY3NoRk5wuY8us4avEhCMXX9o9B8+BrpZU5UNbN7//QUkiPLwNOutELrGzr58fKCY
	 8q62zHY21PE7nTiRmM4l/PyMbzM0r5oyOpm/B6tkE0WUm6SOK+RLvEVEvBeLFZB73Y
	 TYZRKtNSDNRlT8bKTIknu8ulb1kuYW4g7946NUG/g3/Wd3tOSVmGis3lppm3ljrVKj
	 wmIxQEF91Q1SSU074nuQ5CTpTmhNsDoewDuCdK6vKftbCV3zDzAv85qOSlky26q2is
	 mO9EWyAOxhKoQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1228625e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:59:09 -0700 (PDT)
X-Gm-Message-State: AFuF++mIkuOT7IIRPp1exY7mQSrjIwNorr5UXFuAK99FQLDwFuGyZTt0
	PeFqSD/UvvqbCp14cMjgJX31IVn4yokZzUt6h2fNtAMEo9YMjQpyWA5+UgLabcKMoSUzShINgGG
	UjIQzWK5O7Vhd6H4ULy1zLDCnfEFfKvw=
X-Received: by 2002:a05:6512:2529:b0:5b8:9ec5:c936 with SMTP id
 2adb3069b0e04-5b8b6649bebmr704258e87.44.1789563547901; Wed, 16 Sep 2026
 05:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-ab8500-charger-dt-v1-0-10b7b387e6a6@kernel.org>
 <20260915-ab8500-charger-dt-v1-2-10b7b387e6a6@kernel.org> <20260915215334.E842E1F000FF@smtp.kernel.org>
In-Reply-To: <20260915215334.E842E1F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:58:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=rHLsoOXnReox236BAg8Uj=orDpJHMgeQ1d5GPA9Y8yg@mail.gmail.com>
X-Gm-Features: AcwNN1WaHYJri3fGZ7Y8oLRn8ssk7eIp09GroqRW4WwFrVvoxLdzkLzV1fH0QvY
Message-ID: <CAD++jL=rHLsoOXnReox236BAg8Uj=orDpJHMgeQ1d5GPA9Y8yg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: ux500: Drop AB8505 main charger interrupts
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sashiko,

On Tue, Sep 15, 2026 at 11:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Does removing these interrupts cause a probe failure in the ab8500_charge=
r
> driver?

It doesn't matter. The hardware description is incorrect, we cannot
change the physical reality to match what a certain operating
system expects.

There is a bug in the binding, this fixes it.

Yours,
Linus Walleij
