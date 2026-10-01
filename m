Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2D4078DC
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891631; cv=pass; b=hCcBpXEP3YpbowpnKJkfjAQ4NQ7aluhvk6wSkD0xSyw5b4544voahHPPoAKFh6P/E8Gvx7hGI5asRrmeEN+OSlhbnfKbMenTW/z5of0yzoADszd0UGFYBl1ReEytOxCFiQ5tWIC1pa3SaQm+o3pq32O0CC4q8Lp2U7T6w+IOWWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891631; c=relaxed/simple;
	bh=vA19tAGIJDqPrBtiC/KKawxnc593Ufa0N0iSnBpRCWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuG2PnbX7T+ztfGf5LlMd8xlkRJtek75GasyDHckqMrsia30MpPRP2PSPFZ+NbXtuTaPWcOfVBjzmIaKTQsxlBx6Q9BkNDZxI8yeI1zelPsdJyQb2UqAlltuI+AKC1g+Ri5Qnrmcmn7KG7C6po3EUSMGphbKpdvIi0KhAUoydoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5l4H/1j; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5l4H/1j"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6756d2aff02so3441309d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 14:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790891629; cv=none;
        d=google.com; s=arc-20260327;
        b=gvGiTHb2z5muGus2odC7ukhZhgqNe75Jt3Jgdr4c+flC6+I+9yAiZK2y7ixSpDahy8
         /QgzrPyTN5P+o9IcwTIxd70Qw4qTGjg1IbCQoDYiDjHQ3g0GXNFh9z7GkGcs6GhCfF4e
         Xl8tRM5PvpSJ6sMboYbqb/pjKkaqcTkxbca6r3aQG71R4mDusilMWAJ62gQthjVlEKt2
         xdLABF6HRA1IPEfwbS4qeSyn4sshQjhfz7S5YcaN2+KSrZAemkqK5WaxdCIKq7KAix/M
         ULUJfd7Qfp1on9zGt0Kbyol3UUKsKXBQMm19p3WNh4hbh0dnT5zqNZsc6XOEUO2ttSjp
         145A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njBFBYHB/ygG0sy5bqGUdErgBk/nK08nFChwa26Lyng=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=P72WBSXx50lQn13K5khEviHmyNQtOw1seLzfHAt/Z434aiHr4/M0HyljwR8p0oQ+6s
         RSxcXuhoUhE6I2QPFlifcdhO/t8PV+hxjjCNnRsP59gs13WyjPuFZI6W/kVc1sAl74/5
         dW0EJB1oBO4+MCduMe5pIQo0S1LSKZrFj98IIVT19DAzbNwPq7ie5IKMYQunNuOvViI/
         EhHz834lIhwXR6DX3iZSSmZ3lydmMo6hSD3ppezvYVwJKv22O0UpwksyibN7LeKpjGrt
         owTdMxAF55hyx49xAtSYxuoytpFA7Th7dwc42SpP1BOYGlOUGdZInygc56m76+PJ+i9n
         +vqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790891629; x=1791496429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njBFBYHB/ygG0sy5bqGUdErgBk/nK08nFChwa26Lyng=;
        b=X5l4H/1jdjKYfRkB1QetVWTUA48Zxyt61gup5aGJVGDGJGr/ZZqJ6ojjYFcM2/3GG/
         aOacyuDSE5N3VmuBAV6Lo2YPr4ZUgR5LAEHZ7FLx48TzQ979JYasAqh5Hwwa253MOiQP
         +qQQcYlOEcAuF5ThlyuIS1MRCTyHbPwCRMoBhASPbevjI2OZT8TWbNU3nh21p0x9O4Ku
         rHsHTPnzj48bS75+tRP/wkH0IQkM+b232Hg2XSvDrYtzqc8QyU5rS3DjLu7WFIx4gVgO
         EA+TZYvdwpERKOwOz9nS8aJSj5VNBjxtOnhjfOjjfSZ+p4nujQUHc0E/NVNMyz9wAWiE
         x9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891629; x=1791496429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njBFBYHB/ygG0sy5bqGUdErgBk/nK08nFChwa26Lyng=;
        b=CjmKCBvqsAarilNqCUfnVNfgB0PdjNdLHJkJj5phZc1eBbH/CkEkZKHYAfuxrtQcx2
         B+NEjFEzIbiafo/HJ+1VOrKB6m1JfRFgY2u3/TypS88/V4WLO5+K8rzG86q56buGHlPt
         NJ+7F5tyPTztAscCpaYH7Q5IDjD6UrN70ro71Q3APk+tQ0Yk+1mTZjotVWhOm55o2ob7
         uXSD29J0Vi8VDgUpA8OFCSLBzOf7cKDabbKsn4R/82vzK+CXICrU3s80hLKer/fX3y+4
         XOb6UWUubtwJuPemLTrY4+15PSw8QMJqfPYS/pi5Ma7fhGflSC9OcEiAurU92v/nIaJA
         O4eQ==
X-Gm-Message-State: AFq9FYIXQCUb+Nlnh7TaOyBiE+xlTxfQsPXPvUuLnG8neEiQyb9woNHm
	SjGsE2BZSQDqmJvdzUTtt+kNvSgoFDiZbctEndgRcCnKOHLela1uPrFJKcnQynsOAEjrdE1P7qp
	+1PKbaSIkjx6E0i7qWTvfTkhZtRxAvv9+OOkt
X-Gm-Gg: AYBFou2aTeCXzFUIMD/YcaG2xMPhCqAsyf1E0IgJho1oRwgI5UV/zqLHp+pdNBBMJ8C
	GRw3ak+p3vNo5Sj3/wdXwmWWo2x919FRPIrFmGuEpmfi/JDW2bwvTQsx19Tiy5ev07sehQwB4CA
	MBVYMaRfey1NOmkKgUkMnVhGbxCGRTxBp5phampIWtJVq1ECiixG++f8F2hmGfK1P0l7nsDy2ey
	6j9JFNztFg+ZzFKcSgsZ7V7xsyAKp76p9Pb6K/dqIByNW3gpWP6o41L8hXuCE6zLzjVXRJ2Fxh1
	lTUxlcsOpO0MVegh9FNu8p8ly1s+f8+HKCqNQcCvDx/wKzPQJY0ZsQDeZZv1lILg1RelaigdPdg
	qj4CHkyearuQF8dxyUhGBSiZ5w86M71HJ8g==
X-Received: by 2002:a05:690e:488c:20b0:671:203c:2fd1 with SMTP id
 956f58d0204a3-677ac0f1326mr206768d50.70.1790891628567; Thu, 01 Oct 2026
 14:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-37-9b6c217fdf2f@gmail.com> <20260923225247.B92F21F000FF@smtp.kernel.org>
In-Reply-To: <20260923225247.B92F21F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 15:53:22 -0600
X-Gm-Features: AclHuK-VhbFVr2q_qUQkOvb_sVHawA26J4kUVe6GFDVRsehq4ONG5tWwrqz5Ps8
Message-ID: <CAJfuBxw8O+=Z0TjGHDapnUZuu+ffkYsOJdyVPdPQBx7f9Uv1oQ@mail.gmail.com>
Subject: Re: [PATCH v11 37/38] dyndbg: add +c flag to count pr_debug calls
 without printing
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] lib: Kernel oops when modifying string literal in ddebug_exec_qu=
eries
> --
>
> commit 33851d8d7a58ba9b9a4cd975835feabf66d636db
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: add +c flag to count pr_debug calls without printing
>
> This commit introduces a new "+c" flag for dynamic debug to count pr_debu=
g
> calls without actually printing them, saving memory bandwidth. It adds a
> per-CPU counter for the hits and a "reset_stats" control command to clear
> the counters.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 88440c1f6abba..9b789287afe56 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
>
> [ ... ]
>
> > @@ -727,6 +745,11 @@ static int ddebug_exec_queries(char *query, const =
char *modname)
> >               if (!query || !*query || *query =3D=3D '#')
> >                       continue;
> >
> > +             if (!strcmp(strstrip(query), "reset_stats")) {
>
> [Severity: High]
> Will this cause a kernel oops when parsing module parameters?
>
> If a user supplies the dyndbg or module.dyndbg parameter without an
> explicit value, ddebug_dyndbg_param_cb() handles it by falling back to
> a string literal:
>
>     ddebug_exec_queries((val ? val : "+p"), modname);
>
> Since strstrip() modifies the string in-place by writing a null byte at
> the end of the processed string, passing the read-only literal "+p" will
> attempt a write to the .rodata section and crash the kernel during boot o=
r
> module load.
>

Confirmed and fixed for v12.

strstrip() calls strim(), which unconditionally writes a null terminator
to *(end + 1), faulting on read-only literals in .rodata.

Fixed by:
0. Replacing strstrip() with a non-mutating check in
   ddebug_exec_queries():
     if (!strncmp(query, "reset_stats", 11) &&
         !*skip_spaces_and_commas(query + 11))

1. Passing a mutable static buffer from ddebug_dyndbg_param_cb():
     static char dflt[] =3D "+p";
     ddebug_exec_queries((val ? val : dflt), modname);




> > +                     reset_ddebug_call_count();
> > +                     continue;
> > +             }
> > +
> >               if (modname)
> >                       v2pr_info("query %d: module %s \"%s\"\n", i, modn=
ame, query);
> >               else
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D37
