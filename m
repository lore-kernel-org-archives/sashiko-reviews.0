Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E798F3BB48
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786333579; cv=pass; b=KZOj80jB1DymXjRB/fHA+ZKPvVtw3BP4FnBHiYhhSlhSaJeZztfzGkSUbO72NrGt1iJIleHliJjL7ZVsx5H9JO1B611wVNIupm7SYPtTI7XnOlmhuQ9ZljFhp/BuEC7bBq3t7/Girz2U0vVsyjFCIkTxCmke5Rgm4W+blwdrDJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786333579; c=relaxed/simple;
	bh=rZfUDpZmDTdfQ8C0qGITZ8ADGX7cKm4jcQbwyknvyAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTrf37H82HqOQJ6yQVHj3UdIuys9rUuhgpW7/G/50lljT4ZDHjQ0QXUmsivL3P83KS5Hjg5WCLQX8UHdYItONLnYT0Bl/1/1ai/NoeIdXdRRHG82TISCLRfTnaU2dQU5x+JULXy/lrfNOdgVT0SSiD4Q2DuRyJWXcptwvuHv/A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KusSVBF4; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KusSVBF4"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8234e9ea616so25053617b3.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 20:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786333577; cv=none;
        d=google.com; s=arc-20260327;
        b=Tkb01pq2+9wTHXf4K4/e05fspoIWWrPY+JBB25W4YQdSNODfo/SVQweHoHhrh2EgjW
         Cg63F9G8oV1IrdlsesF6JiD7Plj6Yr3adKC7fgRWsij+erbHj9qqOaVEM+nXYdvvay/y
         L9Hc/3zfGmO1BszAuqTyeqcJLYvKMHmeIBVz2ce1qOUADpLkISYQ1rv8jkiZCuYbJW6E
         kMEImyG1lPKUup73akNfYy58/8IU1ICNRU5f25NHOPXWcz4/2A4ZkjEcwmJZ+MfEU/lI
         twgx8+ubKt44jWlc/nmfkMAOGuS4+2fY8JzWGhNiRhsEA6iCWE9mbXFWg8NgVANTc9+s
         id/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJHX3RK2PWO6lQmLZCg4va5QtN/LZmpUOcgWZduGKqw=;
        fh=xVc6MKNofe7Pm2GoW0qnvS3zhFVTrwionBGIcU2h8Nw=;
        b=INoDq3v1VHIf3/WmRDQk2esR+hHlot8sFV9wBzt7AHSPRgkYk1AXghFlIpHgwtGA3u
         uOPY7j+a+i0FSXA8mBQ03XhnEBbtTra19j7iFE0Ro/59TXCx77Ek7HipKwkvQAvktdjP
         DG4EWpo9Ah7+e22XlEqQosHw4nI0n2xQjr+A+5rRQ3EEAYiOsr5PTNQnp5GKSQEZ/gh4
         tfHrdgTeLI6qWRW5E4OhSYJkylJGja8ErO/04rkAimQLrzORZOiMH+EHbWWkW3/8dk84
         Le5u3dnqfj9hpVBO9/s+JrEM1NID9tAHWY+DH0xUfxieNkv/Z8jZXGloZL3glAife0/f
         95KQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786333577; x=1786938377; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJHX3RK2PWO6lQmLZCg4va5QtN/LZmpUOcgWZduGKqw=;
        b=KusSVBF4F+Go/tVyV+PqcOvxN4siiNazs66IwINLfhUUtZaZwhU68DTOclm3vcfRAl
         838w8MQt4F+ALy/3ncjV8WYlWdsOpOmsTNPQj1iigRZiKzCynsm9hV36/8DDXF1zB/Su
         Q17OKlRkPzlzqWugw4IozyRJUs1MuG3zCqhnDlqr9w1W09uSzC+ViG7RjL4wwOVnRDFh
         8FAciKwoZWTHq4n/iYsZIxbPygwaQg4mlXDcsk+5tSO43sfHh3GtSbD3NTupbNRl/B1a
         dyXJDPVX22r9nqZfKBfszD1Wjk4MGWIYdbzqkTuV0DS/COBkNcg0nH2jNCisDjn9zTxB
         8xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786333577; x=1786938377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJHX3RK2PWO6lQmLZCg4va5QtN/LZmpUOcgWZduGKqw=;
        b=oPyX3w8Qi8bODYHA1p9oiFvUG2cDXSq8g54rvvqyzPA9N5+BKyoAlGJEwKIb2IxiY9
         9wGUXUmYXKAPnWoYyHyI7jBZZ+5E8K4++IuUQlWPPnRQ75kRBEVgsuw8Mktg+xx2/8vj
         PDQb01mE9oy2ZftSIdsYQJ2WlIGfhM8j5mxqTrwhnbrdVPCLG8jlVeNnX+DXr3HQZfzG
         g9g1rYHgnwlHWI67JrpKGmT6gC/MSuizqvnqJYuLe2hNUf7WOQXyR57WuUe7HKAHO9Ol
         PC3XFbuPReTV6/D+t56vN1mU4DAVpqnn01tpVi2LXyNFLA88CFtnBUTorJRnraBdztQA
         kSVg==
X-Gm-Message-State: AOJu0YxduoQcem12n068W2sB6uxf5vIJgpWv4GsTGdUQGa6nBhJRxtEY
	DeUO79iJoXOo+KGrjYOMdyxSs8ox1THkuPLpx63n4fq5d9Wyce3Fu2T2kD4BLuVdgmHW2VV2y06
	tQqdgUCvheWvmTF+fqYUO93bYzXidCX67AUCQ2+I=
X-Gm-Gg: AR+sD13mlxCI1EocE3qYQpDSxuU+kqOLO7RvG1hTKQ7RV7erz/4037OGkQPMhqzPpKG
	i+rAu5ffiggqwpX0PLAXsAkKXFaL5vTsZ7gf1igje733fUDfvAbHrV1TLTRGtDK5bf2uvkgii2k
	DjY7LlVY9shs+fXWGHq1A7B+D4UnpkD+DnNy9p2ndrMGw/ewQXLi98Zer24EM86M4fVnUJcB1QK
	sub+g3t1TqA1AER+Ek29pUIGIIMZyQZP7G49Do++ErEEXKOLtFUhy08NsybFkYVGhq8jWXOJ7Qs
	a6jALVi9feyzVsgkie+wrPEJPd11FGQrv8+0RLyfPLQJMd1lclNBJ55IrydLsAJGhBebzIFQtQb
	w
X-Received: by 2002:a05:690c:601:b0:823:3c47:ed67 with SMTP id
 00721157ae682-825ec574f21mr99592437b3.6.1786333576898; Sun, 09 Aug 2026
 20:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-5-laoar.shao@gmail.com>
 <20260809093315.930A41F000E9@smtp.kernel.org>
In-Reply-To: <20260809093315.930A41F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 10 Aug 2026 11:45:38 +0800
X-Gm-Features: AUfX_mysx4P7TAvUfSk2bVe8dMwxjc75u2pCRBB8RPPbG3tf99X5Elc_uSCXP2E
Message-ID: <CALOAHbCfosBwSfv4Bq9itng7WcCtLpm8fnVgJSZdKpHzUi2dGg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] livepatch: Implement replace set for scoped atomic replace
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, pmladek@suse.com, joe.lawrence@redhat.com, 
	song@kernel.org, mbenes@suse.cz, jikos@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `--provides` argument in `klp-build` lacks input validatio=
n, allowing shell command injection during the kernel module build process.
> --
>
> --- Patch [4]: [PATCH v5 4/9] livepatch: Implement replace set for scoped=
 atomic replace ---
> commit 1fb78be5e32d18ecfd4bbeb7fa484d70bf6b9401
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Implement replace set for scoped atomic replace
>
> This commit introduces a more flexible model for livepatch replacement by
> adding provides and obsoletes fields, allowing multiple independent
> livepatch sets to coexist on the same system.
>
> > diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
> > index c4a7acf8edc3f..3600f93d9c1c3 100755
> > --- a/scripts/livepatch/klp-build
> > +++ b/scripts/livepatch/klp-build
>
> [ ... ]
>
> > @@ -189,9 +190,26 @@ process_args() {
> >                               NAME=3D"$(module_name_string "$NAME")"
> >                               shift 2
> >                               ;;
> > -                     --no-replace)
> > -                             REPLACE=3D0
> > -                             shift
> > +                     -p | --provides)
> > +                             PROVIDES=3D"$2"
>
> [Severity: Medium]
> Is there a missing validation check for the provides argument here?
>
> The obsoletes argument below checks for valid integers, but it appears th=
is
> assignment accepts any unvalidated string.

Makes sense
I will update it in the next version.

--=20
Regards
Yafang
