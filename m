Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630F416CE6
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012518; cv=pass; b=mEuUJr24zfuseEak1NNT86v1xrjTN8sYDHHxpecyMZ99HaQt6PyhxKGdE73Os7w/MhiPJu2ZM0Sg7b5NC8kWcSzxL1iHoVi4/76p10/X9hNDzINvYX98SRjLsBDfpRe06WamWXffOJL9vAYVrEevdUi6r8JpdGE2lBC8Sf6ltp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012518; c=relaxed/simple;
	bh=r82KdvGOXCm72vJVs+4ZIB9FFKLh8sHJ5Wzpu8vu38c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzALesdbTkSw342/N51UlJS96cbnGsSIh0I0YT6RZutv+l3jlcY2Gc+qQyeKPU1NuVf0JqNKGuSl/ly+Q9HGxwvHWSkwVeSQmDj1AqG9MDkygcssruFBlxwQ5UG5Y0UpkGs3nqm4lAVE1A3j5EoO0SLLNEOUhtoGalEQInnw3KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7zpt7vg; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7zpt7vg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f9bc869aso674482eec.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 06:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781012516; cv=none;
        d=google.com; s=arc-20240605;
        b=Zpu0XhwYEUcoSIsCPJXHOB3+K9kvSZPC1yAv8f17UEQmT/CrD1SKSnQ02JE0Dn6iJ0
         /ElQ6vbSm1DjodqUtPpyD+IyLhyTBG9W2ZznM6l6jcn+JpETZinDALR6eUnvCLscdVeE
         FZ5yjpbnVj4GhjrYQfz07+yBcpViLf6fS2iwcOiucWTOV60jCKpz3xmpqZUa3wFAPD4u
         WfhTq7v4MDz0cCRB/INWHk3QvedWjc73zCk+gp9l1XlhIz39rKRVP+iokxYuVF/+m5Gp
         kVEQsWJFQAJZIoPA0AN7nCOq8beQiI8f0svQg3qGHVLih+iJtMGZJGrm1AjVs/UHwC7w
         9+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZfH3PDo1pXIJiKrv1MWO7+7Lsn4OALbzs4MUBrez8U=;
        fh=LtK+H3Wls8eVChrw894lAKMfXP5YJQ7RIS6jvjjCkwQ=;
        b=JruV2FQ7fEvjPRoJnQ+/Lk9FzQy4qtglg37LlXMyRx6NxPfQx5O4YepDKxqJ2NHaII
         tZ3rg8mmzONay7Kjn8mBTebX7VJhyI/d0L10e2NZw1WNqvsW20g/TIVwup24Py0aXyf0
         GDHsDkNbTBqfojC7SNXOgpedAAcEBcVmzdZBonf8Ms3j9rmtsLYnF5YWxud5prgGi3by
         kil4j1Vc2wXTIVsOVklwAJi441CnZhremhLWOA48woeKpbOQ8e6ax82fA3FVeh5sT+M8
         mf+6RYq9p2jjcwUbY6cVdEaEZSq2eORUoBwQMo7shXTRXyhARFjxYDWvyG6421NtUGJn
         UYIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012516; x=1781617316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZfH3PDo1pXIJiKrv1MWO7+7Lsn4OALbzs4MUBrez8U=;
        b=S7zpt7vgSXFWWTW3XfdMTmH5t7t10pIG3LR2nmpGb4LtQGaWBqkgAlcCL8Pq6zlJeO
         7tRtr9j+VSSOXzpldaE5GIoqYWJe3DJRB38jJGEyl0kE7Ivca8wjMg37MJm2M0imoz40
         zj7XJL8wjBHi+C06xg5U4U1LPXNWrtnccYqkHiW06ExD0NCsqHJwTeKWx5a6Yziq9TDh
         UF+2IWVN2SbNO3CLBOTWSRvsO2ubrXoRClEqzqiaxjAeEbjqh0nNXha6FBSSfcrWVcef
         xNxZExvdyHbOPuo6/XQpYxCSMzIhl6M3oHhb+hRgA0y0qoVFfwc33wgjF39aXAfOXE1P
         KF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012516; x=1781617316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZfH3PDo1pXIJiKrv1MWO7+7Lsn4OALbzs4MUBrez8U=;
        b=Ao80A8Dleb5Mz2ZAj/NXqOT8x3brBQeibscxRfb/sBQNHV3IugOF8Lj0BO2vM90K8Q
         eR/GOr8kCLrqn51k4xTFd25jb6zrwWYSOjqoe9YZ/ML6B7RzJfhU6W9HKeDE4QNyoqAe
         mEb34fvDkUplAGMBoK1rdnWKLtX5wdRClMjMTdV9S+Rak2ubzq72HU+M5T3R+TVt+v7l
         oL1IDGv4m47p2DdYmEPlmXBUy5/EWMWd+5pVynqtpcfmT0COtEl8GrrZVRC/TbMdsdv5
         EFn3uuxNT+TrxrpdOHOEifbKh0/3Tx+CB4rnHGZJUZfVvnmgosTj0aQ+KGTdFnd/MJnQ
         fSZg==
X-Gm-Message-State: AOJu0Yy1cGvoTQbTXTyG7s54KGlTp36BMUOWnX+3lFIXSwMZJNBvIk3f
	NmqEttsTWHyRSNz23VaN3m9dXOYKJdOuSFyCVBGXW+MMNMeyuWr+p7BMH/RwbJ0ZCo1GfTMvp4G
	iJg+0wgYX8BCgAXdUy+sNut8KK4T7Mc5izplB
X-Gm-Gg: Acq92OHLMHfUUthmv4py38ovyxCzDP8ceaJfc7ECG0olpAt/DchpWjx33gdT74uALqF
	xzBOX4nMxvHMVI9fCPZpnLFBEMu/iInzsbPZYtzkz+aqdH8wfp0mF1F1HPlLIrk+ztGUKbv9oLu
	eZiduhMszwp5gfWW13sp5izlYLyHJAq/pqfZLwUEOIHC2aMLTzinBdQ+a+/2VtOTS8R64C6KGfa
	qqmxjD5wsN/R5r47jzEAdS+RYrRwrsvA0b1HWJqxkF4RujWqD7Bhv1A+JKt43dO2A9eNIyGciHU
	4eRYOIxueQEEJpsA5VGX+8vnUQakg2hDVvOYURO3uQmDQjdsyEtKkc/cfeEax0jv0x0p+hyR8gv
	muA0skU7lBGk5RS14YgE/q3wgRe6alRFd6w==
X-Received: by 2002:a05:693c:3749:b0:304:8860:74d6 with SMTP id
 5a478bee46e88-3077b21ea10mr6154960eec.1.1781012516028; Tue, 09 Jun 2026
 06:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609120325.233721-1-gary@kernel.org> <20260609121103.385001F00898@smtp.kernel.org>
In-Reply-To: <20260609121103.385001F00898@smtp.kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 15:41:43 +0200
X-Gm-Features: AVVi8CfZSPIAPxqYozAs8Co6IrGZUe2AfCIH-4zT-hfCRMC7eSFBNsK3oVTDyWY
Message-ID: <CANiq72kAvoGgG2jG+bHs56z0C=Gk6UUHKQTcuTAK4+WqnVePzg@mail.gmail.com>
Subject: Re: [PATCH] rust: mem: add `Align` type
To: sashiko-reviews@lists.linux.dev
Cc: Gary Guo <gary@kernel.org>, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > +/// # Examples
> > +///
> > +/// ```
> > +/// # use kernel::mem::Align;
> > +/// const ALIGN: usize =3D 128;
> > +/// struct MyStruct {
> > +///     align: Align<ALIGN>,
> > +/// }
> > +/// assert_eq!(align_of::<MyStruct>(), ALIGN);
>
> [Severity: Low]
> Does this doctest fail to compile during documentation testing?
>
> Because align_of is a function from core::mem and is not in the standard
> Rust prelude, it looks like it needs an explicit import, such as
> # use core::mem::align_of; to avoid a build failure.

Ok, I added a section about the prelude for Sashiko:

  https://github.com/masoncl/review-prompts/pull/75

I also noticed we can clean up the prelude nowadays, i.e. essentially
undo commit 72b04a8af7fb ("rust: prelude: re-export
`core::mem::{align,size}_of{,_val}`") and clean a few other cases. I
will send a quick patch.

Cheers,
Miguel
