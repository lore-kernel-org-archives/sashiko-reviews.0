Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A937DAA3
	for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781433405; cv=pass; b=qzGiXCpfYpc0tm9vKl9fUq9ArZ0gzVUEa00dJCfV/O4rpyO/zY9IKDFJWGhn19psnr4X/DgKu60hbqAy24uyhNhC2OPJzYyUjTC3SLeB88xJJ9CcHQRwPYjGDXAqomxlSqD3qkzqgQa6RWUap5/IRcTuX3TqM7Xy7VHeKWy9y7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781433405; c=relaxed/simple;
	bh=LNZzSVh5t+Rz1ZtSfa+00Lh6/l3vF/F0/XGMgP1krc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jh0A2oCidYlsMSwxlH0Vfuy/P6fHNiKkbVEIbzVC4ihxLGvYKro6kdjQhlCDB+LudAHqdYTyodAa7XzIA6qVNr+ofjoppQmwq9WFFmLkDt/l+dMgqaYRd7jRR+tjETk2CfgZDQF0slaYM/6EV8CO5uqu2qIYPjVeMaoeGK2SYOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IxFom/dm; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IxFom/dm"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51765531803so635121cf.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 03:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781433402; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5Mp9lLMCDQla6G1A6CkK5fuNOLTc+xBXqQOIrP9g/f6sqbEl4ufIrrcvlaw679TVZ
         Ia7gXrQqhnDdu6Z445ZqaZRU7wQZfmWk/GYjCCRLCqIeUG2Ik739qoZ9XUtSDsbszfGH
         CZ0gz5ORSMkRw4TtzM53cSJvpbDDWoWSlBKuMDm8Mjy9ALeZw2D2EIfejehgm939WKv1
         k2Dz4CH1twMEAgK2TZ+F2KDAdKlEP02q5KugRBJmO+T60mnWyLdO1dAgHI+Y6mrqtwk5
         LkiR/CITRTTOGq1rMFRyjQB2Bbqxyvs6Cdn8iTQ9Q8EdNjuMnnLE8bHu64OyWNV+rUGL
         l4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zsDo/ZOVPfEdPqS3LglFyoYCxHooaqSGHDtP1XDlcEk=;
        fh=48fClBHdmU35asEny+HL0o+N4HhYgrcZUyMCnQtBrfs=;
        b=SRXFDZBXZtn6Lb1e6m4SQJYvnG11Pzyup/hB8RQqUXWHJ0/pU35vioxhkUJjm6xtBV
         +cFVfPHamwYg9TjgoOWJ72QtBZLT+AEsinByeR4a4R+/G3HeyBdMW1/KB1sb9PTUFe3R
         3Qfv8WbceJIVklFdpZzv8DV2VdP81DwgrGkb3NvVdqLfWkDlYhcmjOlcp1sseVuOJNx+
         9e2qx1CJ4nvNQ8n6ij2u5asoEkC8OJtPjyAUZfKPOfvfeqZbRshq1fxpKtNmd5nC3aqd
         uWWCVO78dN5Fif2fQHKeixQWTpYf5Vgm4z1FaQVJbkrdqGB8X0v9mXgMf7XEeTfJQ34V
         fI4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781433402; x=1782038202; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zsDo/ZOVPfEdPqS3LglFyoYCxHooaqSGHDtP1XDlcEk=;
        b=IxFom/dmFGNj1vtWVpzvQu1fHBIBNDx3oabg+Ada7r+ovFGOLjKh/ed7fAfIW02lto
         76kZhMpxr1tn2/y0h3KLW1Sd6PEV30uJ/fqk02Rvm2t29BvZuxCgU4EGMxlpC1+EPxqP
         AEK7UT/vCdg29l9e8tyWS63BsnAUbnJCP43NnLyceJkagtzHXZarw4QF4SnNGiTG7R/U
         N9j2r0ydZaHJdbqCLu+Z5Gk1sKYLeCySV3aLw3WcAPU/E7/wcOmYFRM/EMQ3uuZxgY02
         MSFFO0wIJiZTYRUZ1FitnTDH7cFbrvo/UUwcJFuZNZpeI1QpHFedXA70yHf57nBawhN1
         rl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781433402; x=1782038202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsDo/ZOVPfEdPqS3LglFyoYCxHooaqSGHDtP1XDlcEk=;
        b=Fedr0thc1onU9as6X8K+7ebZ6Q/0WVDdMu/kqPTmOlbIH8kSJ91YodJCeaUs/0eDt7
         koniSTdaObuNQPeMRw3yyJRBIm7TFAbmc06w+NU9a+MXdZdKFQcWhqTY+f28X7v14Pay
         fdvExo8eaclf1O8W12WibT5UetkgcQygTsxjd5dTDCBJmCEB0o3Ar8ylo7QWZpGwarIp
         YYmSNtHNT9cVmsgzrwxxK9Eka/MuYGOTrqLFn9F0nLZY8MiYUAFFkWmiJxV/7fNp39/U
         Jbi/cI+MTYn2F5Rl+7P8QQxjOiEwKZN3I9s0Kufbj7bG6e/j0mmj0ZMkxJHtiGcD5BHZ
         yPmA==
X-Gm-Message-State: AOJu0YxIWF4JFieQT6PYfoUMC8wtrqgvJpSjwH9dmUA0SEA5FYM+1hHH
	9YqHUH5HycZbJlxaOuA0lqpaJpLcPdrCDbZQ2OnJMoPp96XaQidZiDgodZPL4OreVePSHSvwwzO
	MJvZlu3pF2HTrygOT+5FVodv9amPXSay8XIk/w2Ls
X-Gm-Gg: Acq92OEjUjlbX268wJnBUMfkU40HTpkpUHaZ+x3hPgsYt8Jw4FiDM4pymqYn+BfwpXf
	QYiI6iOGwEcA3pVzeDYCufQBWb75TJWW5knuF1MWcQ0XlT97lSfx0M0gI1DvaALp0ZPsB3KToqZ
	hZdrl0dA1IJprDYffQQYhzPypALx2APWBFAnz2ux+GHUytyFSDMM0db1EWicQ3zIKGgT/Lzvw5y
	k1j2RaKdHBMnXxnUzop7sh9lrgztNe3hqwgdV2iC4PlzLxDZDUM9KV66js3MTXYiRgOa0tdW9Nb
	j/QPkPTb
X-Received: by 2002:ac8:5c83:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-519549b2989mr10393391cf.10.1781433401238; Sun, 14 Jun 2026
 03:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612113414.1022901-1-tabba@google.com> <20260612115044.16E3B1F000E9@smtp.kernel.org>
 <CA+EHjTyFFf__9iGFAyAkechiX+gaiK9ksdfgxLSFe8RcAY=HGA@mail.gmail.com> <87pl1t8q24.wl-maz@kernel.org>
In-Reply-To: <87pl1t8q24.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 11:36:03 +0100
X-Gm-Features: AVVi8Cf25BgmHVzixnH72Pp4x2je53tjyX44xbNfRJni2U2FbMN2z1y0gR_1GS0
Message-ID: <CA+EHjTzNPabfo3bnuMuBKKz5T3w=BdTdSkZ7eD3VGZAiyrhJNA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jun 2026 at 09:46, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 12 Jun 2026 14:19:10 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Fri, 12 Jun 2026 at 12:50, <sashiko-bot@kernel.org> wrote:
> > >
> > > Could this cause the guest kernel's exception decoding logic to fail or
> > > panic?
> >
> > You're right -- the architecture mandates setting IL here. Like you
> > said, this is pre-existing, and I'll submit a separate patch to fix
> > it. But first, Marc: was there a specific reason for not setting it,
> > or is it just an omission?
>
> Just a plain bug. The normal KVM code is usually careful to construct
> the new ESR based on the source of the exception, meaning that we
> always convert ESR_EL2 into ESR_EL1, and propagate IL amongst other
> things. This is obviously not the case here.
>
> It'd be worth auditing the rest of the code and make sure this is the
> only case of IL not being correctly set.

Thanks Marc. I'll do that and fix it on the respin.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.
