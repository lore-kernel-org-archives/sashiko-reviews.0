Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8B38C2B8
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485511; cv=pass; b=g/bDr7fN2/UpymKwQOrd3oYdwvWgtoTqX8udzs6PHMc/I4T8kY/bev/9s0H7qdNHWu+wDfloBiPvMnaRGSnu/agbTzFEpZU2Hn3dE6ZjIUam8zNu2Z5H85d4QAVNdgvM3XpkbcJEqnU0xpBFZTd+ZWxiuN7zowH7LKY5val6D9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485511; c=relaxed/simple;
	bh=lhUCrdS8AzT6YiUpPvI6mNn4LsPzkSoFmcLVaCCgCIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZUlfWy3/P8ogh/lWMgS7SQ3r401okoWq4k/BJ8VjNF67s8UXEexdL/XXUEs7DcYTwsWeE2wn90ORCm5I8Tx3pbiVrtiUJdvFWtTZFOTl+T2JA357pqkNA15UfKENVEdVjKDgML+zDwwypDgjfp/gA24bDmOUdNUimDxVH/o+NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cYDPo63a; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cYDPo63a"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1331e851faaso4131006c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779485507; cv=none;
        d=google.com; s=arc-20240605;
        b=S+WdvJkszHT2Ir/fxxxrOzdsuG8YIYU/DFyCPJiiw7rnR+WRDB670Bxx4sHO9pHt/T
         nrPjyyhR7VmuLKI2qn1NovjRsltl5RnRjCJLB6id6r+as6Ow4Qipfrrjq1HyzrUoOIxc
         aClbxIL5fQnhEdJlzvLavUjyedl9KWUHwvetRvmFtz7N2L7/tOY9Ef2zLXvH7HNGkDIH
         GkFQqBWzBnD6ajOpwNVgvJNBgUR0blkz5nUVQj2ZGOqQ+W2+JuQsBOvfN3aiZvgJJfCh
         /xVhb9Ph/RfxgrjNg/K4vm3RDWOKAQE/tjJN2JU5oF/1EHvM3f9UCxc2O1up0ubJkHbV
         MMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH4ZOzGCp/1wUSJI9UajBWmDDn0DBrPYAfdLSalBmfg=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=b5+6SBxHbKfQ8b+J5hIxHgPR/s3+oyH/Jl0F/uIQp0OLrjk0T7ySPBDb6llPr6JCua
         EHan5LvGA5kJG7uwKRo1Ci9g0A249QHi2qKGL/U9habIA300qe2WQ6r1pLl7d6RabIVo
         D++T83qMjW5P9TA7jLhlmhOJl9wVFKDIeU8hmUrR/xvi+kEiiBq7EOtYalOy7uMbRKRX
         GWRw4uRNdqquRjLVvPejh7YNEVzDzcuaMp6lWlupYzIwthM1tkS4DOKS8PgabhbqGJPD
         tjABoLN9e5mNDFI8GTOHQiycokxy/maeaNgxiQNebXaWXEQqq4x6h/+iOLGq9owLvUJy
         f5FQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779485507; x=1780090307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gH4ZOzGCp/1wUSJI9UajBWmDDn0DBrPYAfdLSalBmfg=;
        b=cYDPo63aREkwP4K9fA+P0jVHZP5/m9/DorIjMft/yuxET6isrzhzgBiXk+tgceR35o
         UhKx94WDMjybhF+DISHQpeISrIDswkFG9+ueNBzIDcr7SoUDS41Wn6LjzSGAB4CkMuiI
         VvDB/6rJyGc+YnoPwF+E5XwEqazp2wjd4i3Db+/hWKb7807xGjCjR8KPhgHwpNbev0JR
         3gJEmZD1mKVKU1wl3BFXdQsMt76L7ObT8Pj7Qn0gQXGmKvy3h0LmiI2f6EVa1rooKvol
         yXeuBXAzrJBVt/jPl4SyQ+q3ZPGr3pzpAIvu+zYLdmbYrhyIkcGsJrQmpOn9f4GvKC5w
         8Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485507; x=1780090307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gH4ZOzGCp/1wUSJI9UajBWmDDn0DBrPYAfdLSalBmfg=;
        b=Mg2iMVI6Cx4dohDHaCYvAQ5B45fkuzSAUsYG6u2S3MuR1Cm7dJtwVcNTTSnASmv0h2
         lkCXk6T0nE9P539VoevzKTP2E0Ql7/pZnse/3n1i2+mdlFWyD/eYEaYlcuT7SvFxZ1jc
         60R3UGfPiom9K+uNrEB9hl2vEKCywA1g/O+yo+D46s+6LbyjcKvJUCmW+ndHm45nrJf4
         AKGEM82RAx5qkRpdwj9nj/LLkGHb86PgLP0ALgC42ubewGy90ICGwKRJHv2rPYYjM/LM
         La4k7F60IqS9DQFQFLrFQTED5VONhsSe5A/PK49XXvHHWXEPqxDjh1VAnb00S+zdWOax
         Opzg==
X-Gm-Message-State: AOJu0Yz54dn9HFGBMWkwRPitZ8SdJS3sej672xW9raWoNzjJUEKZNkIA
	IhwHqtTG/nyYPR68J9j6blTcyX9DJlZ/brBc+5wfwIOFW4PGM9nQM5E98pqjvz2yiBLfpRQywPl
	n6lC9wlsG5Tlw/Gvsw3bF/E7NsWuJyIWyQ+KxCmnvEw12atIZirL6Pg==
X-Gm-Gg: Acq92OEiqgg8y9OAcj5RSM4xW4prnsGpj6kpSPIx+NvrKbwJYZD+5pcr4Y4Sfoel3po
	LjzDjfUZpwm1uk/a1o2xY/Xe/EfIZBIQmZwc0qFtAnCxCGjDzP+YROSdLKTdgkSsLfFThkzaMms
	91yBFElvfuhb63EPHcf2q8lN+n2u02+pND+dTkyyh1UUfCOReT/F4Pf87k3BBgaD/MwWQlz0+s9
	eAZlQddzGHcZIPw0Uslr/Wx1B+IEC1LiVtC5UrQG831mgE6ZckHt9pJ+iin2mb37bOaRhzf7TQO
	+LzJFwiOEhkB4Y4Edg==
X-Received: by 2002:a05:7022:61a3:b0:136:8b76:14eb with SMTP id
 a92af1059eb24-1368b761676mr393791c88.14.1779485506467; Fri, 22 May 2026
 14:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522202410.3104264-6-dmatlack@google.com> <20260522210848.6E4071F000E9@smtp.kernel.org>
In-Reply-To: <20260522210848.6E4071F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 May 2026 14:31:19 -0700
X-Gm-Features: AVHnY4KtUaRLVMOD-NXvStODJghFVTqbdFSmxbdst0oS_AQ4Epk4q_B3c0DtFks
Message-ID: <CALzav=dzAa9nxQ4ucGe1Y+Vo16qaJgN54vhyMtgzutXKp_s80w@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Mixing goto-based control flow with scope-based cleanup helpers (=
`scoped_guard`) in the function `pci_liveupdate_scan_bridge_begin`.
> --
>
> commit 12ae1f010eb68b0654e38ce2800545f03bf1b835
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Keep bus numbers constant during Live Update
>
> During a Live Update, preserved devices must be allowed to continue
> performing memory transactions so the kernel cannot change the fabric
> topology. To keep bus numbers constant, this patch makes the PCI core
> inherit the secondary and subordinate bus numbers assigned to bridges
> during scanning if any PCI devices are being preserved.
>
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> [ ... ]
> > +bool pci_liveupdate_scan_bridge_begin(struct pci_bus *bus, struct pci_=
dev *dev,
> > +                                   int pass)
> > +{
> > +     struct pci_dev *parent =3D bus->self;
> > +
> > +     /*
> > +      * On the second pass, reuse the value that was set on the first =
pass
> > +      * so that the passes are consistent with one another.
> > +      */
> > +     if (pass)
> > +             return dev->liveupdate.inherit_buses;
> > +
> > +     /*
> > +      * If the parent bridge is being forced to inherit its bus number=
s
> > +      * during this scan then this bridge must as well, otherwise the =
PCI
> > +      * core could expand this bridge's reservation beyond its parent =
(which
> > +      * cannot expand).
> > +      */
> > +     if (parent && parent->liveupdate.inherit_buses) {
> > +             dev->liveupdate.inherit_buses =3D true;
> > +             goto out;
> > +     }
> > +
> > +     /*
> > +      * Otherwise, if there are any incoming preserved devices, force =
the
> > +      * bus numbers to be inherited to avoid changing the bus numbers
> > +      * assigned to those devices during enumeration.
> > +      *
> > +      * To keep things simple, inherit bus numbers on all bridges if a=
ny PCI
> > +      * devices are incoming, to ensure that no bridge's reservation i=
s
> > +      * expanded to overlap with a preserved device downstream of a di=
fferent
> > +      * bridge.
> > +      */
> > +     scoped_guard(rwsem_read, &pci_liveupdate.rwsem) {
> > +             struct pci_flb_incoming *incoming;
> > +
> > +             incoming =3D pci_liveupdate_flb_get_incoming();
> > +             if (!incoming) {
> > +                     dev->liveupdate.inherit_buses =3D false;
> > +                     goto out;
>
> [Severity: Low]
> Does this mix goto-based control flow with scope-based cleanup helpers?
>
> According to the cleanup subsystem guidelines, functions should either us=
e
> scope-based cleanups or goto-based cleanups, but never both in the same
> function.
>
> Could these goto statements be replaced by directly returning the boolean
> value instead?

That seems reasonable enough, will fix in v7..
