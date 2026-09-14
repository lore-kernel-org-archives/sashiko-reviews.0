Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE043B4BC
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 22:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423737; cv=none; b=dDQc/8JyonfGxbKuWF/L3YmzpXiiHBWhK+3sKMgwekApa5rGxTLkoApAdjKitWL5UaBwHuL5rsSXFFknmJnGEYNzJ2C9ZLANDyLMGoCa0bWwnoDP7ZAF9SoXEB33eaDVCwflhme/mdbI2pk4GaCs5qr97MHFKk/yQSZPDbjeWkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423737; c=relaxed/simple;
	bh=xNbw8vA5DZPyfOs8ZeU7rTVfz5kVZd447qxPtCAcEHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+sxByuf1XJFjdC0rTk5ufyHiqZc3qjmednCUC8GVSe9tpGMfDCcEmTH2Y7ksJ81M7htM9o5vVfrwJ051bfa+MV9u9zH4dmN6+FS2qzkpAw2mlIjCYfSNQUiizMBqohqaUhfDmUiR1OfuQMMIQFkS/HqS/j65HWjrdUnY4KKFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLNy6V0E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLNy6V0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078941F008A0
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423736;
	bh=xE6GI0N107gqEBqtwBnl1jLwcoG4x82XH936Oea3vvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dLNy6V0EhpOpqix42EiCRcRbq9CgasA6T+TEXfI6qNBmTiJcHs8G78lt8IkKz06FL
	 0OysAIZHRi2BUoBTYYPvAaBIx6E9yidFMFgzwCx0lk+cxvPwPFrNVdwy2eWDgGsfWV
	 W3lDxo2Bod5iAGabt48sB0lazWGm1n223FOg2PuRSit/SWAa0Nr2TJH8CMVjXlh/fq
	 EBMHVE4WKhEWgidsCmRWyBXJ5mLBWwT+JJJWVqJPLNdOxDrhKpqG8m1Pv0Lp8lSCHk
	 otSr9UPpQoJRmeyU9sMSYzetTW4S7yobZ1yicE0IfOAncm65zkmFNXnaJ+deT+RCtB
	 cOz95lG9b7v1g==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ad20d4so316534985a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 15:08:55 -0700 (PDT)
X-Gm-Message-State: AFuF++m/T08a4kRuRgu69F8/jD8gsAfklHXnZAl/z4YTgQx8Mv5XFVQg
	8Qos3Oydn/VytdAxAelDdeye+j5eIDpJ7Xkh0ADjY16Ed+pxQrqZmctM6xJ9Nl7UuPoxbSF0/fn
	1vohEg1sqowCtg2FM4Z1j49cpWblnV5s=
X-Received: by 2002:a05:620a:640b:b0:939:7144:485d with SMTP id
 af79cd13be357-93a29a94717mr668698985a.38.1789423735224; Mon, 14 Sep 2026
 15:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914062514.926997-1-song@kernel.org> <20260914062514.926997-48-song@kernel.org>
 <20260914064856.E15421F000FF@smtp.kernel.org>
In-Reply-To: <20260914064856.E15421F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 14 Sep 2026 15:08:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5r85Bw5N1tiNa4qVP-zwYhJ85FktxK=ZGCZMDK-uY34A@mail.gmail.com>
X-Gm-Features: AcwNN1UeGIfEHYuuWwNiJNYxfXLAMh7G8PtWrVGGEoOUrag-Dl9Dvo14IvWNteM
Message-ID: <CAPhsuW5r85Bw5N1tiNa4qVP-zwYhJ85FktxK=ZGCZMDK-uY34A@mail.gmail.com>
Subject: Re: [PATCH v2 47/58] objtool/klp: Add test for symbols with no
 checksum entry of their own
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, jikos@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, joe.lawrence@redhat.com, 
	pmladek@suse.com, kernel-team@meta.com, puranjay@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 11:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The generic check for duplicate addresses in the test script uses=
 symbol names instead of actual addresses (symbol value + addend).
> --
>
> commit 8da269007d7ca99a4b81784ec070f665fec2ad95
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Add test for symbols with no checksum entry of their own
>
> This commit adds a test script and a C fixture to verify that objtool
> correctly skips checksum entries for zero-length, alias, and cold-part
> symbols. It ensures that the invariant of one entry per address in
> .discard.sym_checksum is maintained.
>
> > diff --git a/tools/objtool/tests/generic/test-checksum-skip.sh b/tools/=
objtool/tests/generic/test-checksum-skip.sh
> > new file mode 100755
> > index 0000000000000..6e3e7055d31c3
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/test-checksum-skip.sh
> > @@ -0,0 +1,72 @@
> [ ... ]
> > +
> > +# entries_for <object>
> > +#
> > +# The symbol names .discard.sym_checksum has an entry for, one per lin=
e.
> > +entries_for()
> > +{
> > +     in_relocs "$1" | awk '/rela\.discard\.sym_checksum/,/^$/ {
> > +             if ($1 ~ /^[0-9a-f]{8,}/) print $5
> > +     }'
> > +}
> > +
> > +entries=3D"$(entries_for orig.o)"
> > +
> [ ... ]
> > +
> > +# One entry per address, which is what the skipping is for.
> > +dupes=3D"$(entries_for orig.o | sort | uniq -d)"
> > +[ -z "$dupes" ] ||
> > +     fail "two checksum entries for one address: $dupes"
>
> [Severity: Low]
> Does this generic uniqueness check correctly identify duplicate addresses=
?
>
> Since entries_for() extracts only the symbol name (column 5 of the readel=
f
> output), this check doesn't seem to evaluate the actual resolved address
> (symbol value + addend).
>
> Wouldn't it fail to detect two different symbols mapping to the same addr=
ess,
> or potentially fail spuriously if multiple static functions share a secti=
on
> symbol with different addends?
>
> Since this is a test script with a tightly controlled C fixture (without
> static functions) and the alias case is explicitly tested beforehand, it
> doesn't break this specific test case. However, should the check be updat=
ed
> to use actual resolved addresses instead of just symbol names?

Fixed this by adding an argument for entries_for().

Thanks,
Song
