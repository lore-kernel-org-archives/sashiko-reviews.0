Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285730E847
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 01:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327569; cv=pass; b=BC66WZ/EEOnOb7U2EcJdAVyBOfesEpmNwqLa9AbkFRRPbA4hrRn9Bny2OZN23zDWA/IIyaVIIY//ZVb7rNhB464PWygxSjdG4MTcZE3lRmFuWva3I3tskiOBQI6Gnh+OmFPSZbx5cmaqiTAe6pLfoyRaNnkJ5rAsim4QaYcc7nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327569; c=relaxed/simple;
	bh=yECoRPcc9MgdwydAyixOT6oWVqh0Soy6ptJGTKcDeQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNRFdaWYZ0QsJ8gLYi1ZjrJ28gPnbO5W3B7NigS+m1RMsGET83IAfyWr82vqpDoSe5N5/s1Xh+HohBRT2iCrbh94y3Ia6pEOKcVotG1xqIZKM/tfhZAEBxq9wLfZDQWQepLQqz0INIjfJYkTfhmYSN6qGU1k+LCOvTAaPeLFDRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIWuwVK8; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIWuwVK8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so9313235a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 18:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779327564; cv=none;
        d=google.com; s=arc-20240605;
        b=ku+4HpwY1f9knC7SY0XNPR7nJeJMh9lbQ0DQs61ZXNvWNLujLJVKwBxPlHyhrY3tXf
         uEc/kOtjVsEXBhREBteL5bfByQF9YFdTxvPdi4Bh3kYsoJnvHBXPFyUA/wUl0aFTTQtM
         3g5DDoJP3XNn/cW36nJ5qobZJ9+3LyxNeM0pKm5eegJhgFgr9hBEbKOFDFklIkgJ0/9D
         9LvP8l4il+eJ8pqYhvLohd+u3wRe6oI6YQqCoT8JiSAZnD5yZzUMdfXPiWocm3Hy9moI
         9C5WGBrjzWk3ijH9MKaqsnTE2i1Vqgx5Pwuf4cbSfmQYa6rNlQ2mtMJ+KFyvZJAF2LK9
         IoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/RUGoJFhQql3Jq1jdEGsiasJcwn4x9hrakVluPPHDc=;
        fh=axCKqYYUA47CQTJ2k0ihR9iDScnR8cIsb9HMXksIiCw=;
        b=YKrsykKi7k40bPOmHJkYgWy6mpT6N9syvviRahEueSL2wp6U4pr2bJH3rXoEH+Tdzd
         irR2M7qlOkOfjmiXPwJjwWXIRpZIkQpkYeafQrLken65PzDrck9SVeYR46+Cm1mT4Y6Y
         Joj9KN/0wDRnsQE0yALX5qlSbtTG7IshgNWMGgRCXY9ULv0w+efWv6GP/zuDXCDXTa7U
         bjkCYVppJBJN0vNjudbn7Yw6vM1KgGtnLgev15mIOZYBUrFZWSV2k6zDdD6VUTQ600yL
         +nLU7St0HK+gs5auBQ2zogGRNJEgo5kaJjtBvuIrgsg4rYqOfOR7VIxv1X3BwsW2l8ph
         0yjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327564; x=1779932364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/RUGoJFhQql3Jq1jdEGsiasJcwn4x9hrakVluPPHDc=;
        b=NIWuwVK8RMAoT1eVcVUEZM8pkLMJYYP9gsoRk9+ZZm8A0ap1W2wwl5mJopTIORC6nx
         nQRrKxavJZjnX49oyJIkCECIA0GuKweEaGoP4bEu7GQiwrx7qeW2u8EfzjK5kpgCyhG9
         koC2YWYWrhYIf2bVDBx4iqyWv0sFlIHSo9IEmvO02mQzUTKLUZp2zt9dRM1k+cEf0zrk
         8Tnc70xOuUK+GVpT7Zyh5Kg+9QcHMlGzlcPGAbvSNSPiAePx/QOjpyQKjRXv5o2fIuLk
         HF3RXXtGv4as7QwUapgkh2FDm/zPpoCl4uloPhROjaFyQ5EyJ+mqmR/A/qoRe/yrV7Kq
         Dpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327564; x=1779932364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/RUGoJFhQql3Jq1jdEGsiasJcwn4x9hrakVluPPHDc=;
        b=orq0eD6NiHIyhnNvaazJQXuZemEk1D8lOt/Fjn5oxibiZiDr1yreQ2R9z3uC1yn70x
         /CXUmPZ2D4JOearsJ7mRU0Yzsubeyl1CK0TL8jHVfOWiMQU4o09hMy/v1TWC18gxXf/2
         ET4DqRxVdhV8jc17ToUXcevZhFDABkMARLS/FczRjN2pUZJ9bwW/ETiR4RBUpKE9vr73
         RnPfUwOAkhY+zpIC8bnrLT6SF9nJEzRvG07GxcWfF7sHLt/TUVm6Lkn5Pp02fnSvXYEA
         oGnWa7PjIvtebfw8A1TC7r5SGXN+CNx0jDT4w9Js7/AoYufFFPeFTU2N0YTaNWeGvc6c
         IkiA==
X-Forwarded-Encrypted: i=1; AFNElJ+bVK0kHXX/jS7XgYszUjkE3WV3crl89QGap6TUEqEIdJbYK3FAUMCxfGqchIq6+V8Rey1ESs0SktXsDE9cNFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbHYj63fW0L+sNoUpU8Ny9Tq/pG9MpLUP96Z1Odjzv3M7Tytc
	NbTLCJAbxJA+bjefFAPHHxfoPMSjC7yWLVHxINdID2kQBBE7I5eklH7nSFYq++G5qfk+Rw7c7IR
	pSUctx6PwB+ofe5UZN7z8BQ7q61mSiec=
X-Gm-Gg: Acq92OEZTvUurPSiuic8bOBRcyw99tmE9ZsIec0eYiVlGzLnU/wymW6btj7j4tjteea
	wH9kNxhfZWIQqxRy0Bh1hTdOswk7eC9CiFnz97hj/8+7Secx5v1z/xge68DkFIRdovEkzmYXZNB
	sf+/NgkhHSTMMkvO0XjwUE7TjUqNcE1RAi1w700/JZivvAOvWpeO75UCJDaxvUna/VWiCB2kz2P
	fBkHHvPDpOO3srm1TSV1gXhdftBeq4aD4Z2vMRs44DtRH4lplQXFB7gxK3urfilOxixhGoXlmFL
	ROdWCyc2spX8H7PFt3XCPeN4HToscCgxVWnkns8PS8YRxs3emfcXUoXNyZRKfHbNGQpAvhG15p4
	MGlUJ6/PawVTWuH/3x+42qVXTwjgYsvgiuXSezMSKiWCgFPy5ZS6rfUXgNA==
X-Received: by 2002:a05:6402:350d:b0:674:b355:555e with SMTP id
 4fb4d7f45d1cf-688361e8effmr290030a12.17.1779327563850; Wed, 20 May 2026
 18:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520220030.16887-1-rosenp@gmail.com> <20260520212829.7734bad4@fedora>
In-Reply-To: <20260520212829.7734bad4@fedora>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 20 May 2026 18:39:12 -0700
X-Gm-Features: AVHnY4LQeTesc3cnK822HfQPnh4iCrlGI5xL2YTKDzM_S03rlZsU8Vj5cMWtZQo
Message-ID: <CAKxU2N_WKn-3EFEpWYmqTWY_GWqJfybn3vsmNJWX78z2SEtpZw@mail.gmail.com>
Subject: Re: [PATCH] ftrace: Use flexible array for hash buckets
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"open list:FUNCTION HOOKS (FTRACE)" <linux-kernel@vger.kernel.org>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 6:28=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 20 May 2026 15:00:30 -0700
> Rosen Penev <rosenp@gmail.com> wrote:
>
> > Store ftrace hash buckets in the ftrace_hash allocation instead of
> > allocating the bucket array separately.
> >
> > This keeps the bucket storage tied to the hash lifetime and simplifies
> > the allocation and cleanup paths.
> >
> > Assisted-by: Codex:GPT-5.5
>
> I'll let the AI's duke it out!
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  kernel/trace/ftrace.c | 17 ++---------------
> >  kernel/trace/trace.h  |  2 +-
> >  2 files changed, 3 insertions(+), 16 deletions(-)
> >
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index b2611de3f594..25a9dca290dd 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -1082,10 +1082,7 @@ struct ftrace_func_probe {
> >   * it all the time. These are in a read only section such that if
> >   * anyone does try to modify it, it will cause an exception.
> >   */
> > -static const struct hlist_head empty_buckets[1];
> > -static const struct ftrace_hash empty_hash =3D {
> > -     .buckets =3D (struct hlist_head *)empty_buckets,
> > -};
> > +static const struct ftrace_hash empty_hash =3D {};
> >  #define EMPTY_HASH   ((struct ftrace_hash *)&empty_hash)
>
>
> According to Sashiko: https://sashiko.dev/#/patchset/20260520220030.16887=
-1-rosenp%40gmail.com
>
>    Could this conversion to a flexible array member cause an
>    out-of-bounds read when iterating over the empty hash? Because
>    empty_hash is now initialized as an empty struct, its flexible array
>    member buckets has a size of 0. However, empty_hash.size_bits is 0,
>    which means loop limits computing '1 << hash->size_bits' will
>    evaluate to 1. If functions like
>    prepare_direct_functions_for_ipmodify() iterate over a default
>    EMPTY_HASH without checking ftrace_hash_empty(), they will attempt
>    to read EMPTY_HASH->buckets[0]. This reads past the end of the
>    struct into adjacent memory in the .rodata section. If that adjacent
>    memory happens to be non-zero, the linked list loop could
>    dereference it and cause a kernel panic. Prior to this patch,
>    empty_buckets provided a safely zeroed array of size 1 to handle
>    this single iteration.
Yeah this looks right. Might as well abandon.
>
> -- Steve
