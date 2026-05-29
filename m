Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB83B8BB6
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046049; cv=pass; b=fENPHkvS58OCRwGlvCUDGchh96GzTk7P/NTxsqTdl/Yc2G8/3HtlnpDRkm5c5bWQKFHdqLFeUYd1br0qde4Q6OpQG6ZSiW8XfbT55sZZirqIQq1U8blpu/Up9sRNJUnbT16cAk2LuG9dn1Vr0ezNDq4wzMe+3lxxh61aj5xe6qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046049; c=relaxed/simple;
	bh=UkkTEUlMTHOynzs2J8K6m027MEI5I4/ej3CDloGm6K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZmc68cR/QLKWPsm5VYjajRTn9h4BJNdwU9AV96vgSEaqVmOdMzr2mrzKxNYOAnp0hv6CeEr4S4WO3YYiL5N+omWQsBSBrzhyzm8MRaWA4On+IDF1q6TFzlzuAoi6awz64lXYHN1Kuf+2XFbz1NFcVBZYk9Z3ArONa4j7wCxdMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=olW0twAO; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olW0twAO"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7ddd3d67084so6920327b3.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 02:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780046047; cv=none;
        d=google.com; s=arc-20240605;
        b=IMX8Fh9Z0LstWTX3pl/XcpzB6w9b2Fof1a5E7lr7YTP/u3K77Q6CTN6U+ryTJbv2rW
         tvkZQFehREp1fltSc70P+WRzYs5BEEgWqgKDGZgZxLfNjWZhU7DXJpIpgZGyZLveu93C
         EaR/5e2ktKVD18SkhewKzNJaL329BSiDUFEdRA4C7EJCZqVCIxxv7tmu8fM/ebBaj4p0
         NY4FbxzeccsUszN7NPox1/vGGmRVyX/131zcQ9u89Jsw0P5ucRbSlLIJFQywieZq8Xl0
         LDXuAj2m0NU1AyW6FSjaQo8oRYD8RlKrD2sXlgYhRS0YAv4pMapb7L9g8pMgmrvTxHx6
         vwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KgioJfiSLQsHNHryEgZJ3KiprT6RmzRs4G29o8NwBLM=;
        fh=Jr6AY6a7enjsWBanX+asmWGR655WAKm5wv/lzU741Zw=;
        b=YpUHuwzJKknoquTpDz0ACWowJx1NVhjpWTJwL+WGrzb75X23HVwqS+RoLDt6rLif0w
         DooJfMM4VF3APphwGRC1DwXxRrxVof7Os/O4BaH5iiDNtszYkL1kdbwVaopeceZo7vM7
         37QDK/odt/hOxicmPUtSFyu9hh1IMLkRqif5HrnO4oUc4cpaNRVTfqkPw1g4LKdYHLNB
         JOUFLj/0ELEk2pIw5dFCUy5DsDzzHbavEse9SkOjVyiIkAzaT9rR8iLB7BHdHdEo0hgD
         uWqcNJhCSeyQQn+TPrA73WM97KPitxOxRNSueeXbhJkiIEFBIrbIAQEM8pBGn/CqQTKz
         fJPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046047; x=1780650847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgioJfiSLQsHNHryEgZJ3KiprT6RmzRs4G29o8NwBLM=;
        b=olW0twAOlXYLZYuJbrfqsEauNqe+smLnlXSE19Zpo5kCcITa1H//STdp1uzoclmwwB
         6pfWpNzWNN1L6GBuDLjFK+KQJ7SXmt5XqY5A7d8odc8sK4iRJRhBulfC9mVwJNseUGrH
         q2ivMeA4+47nvonb7fOaw7Au4Mlb3twGvaH6L5X4KWcfxH7STvCv3Dga6Jrt/LJsT2JG
         5bj/m+fhzSWrmuqHZpjkQ0rqGMDn0e98rTj0W1Mi35oNU74ccgUf90V56sU5gU0oLmru
         xBwI+i9WPgFVIKC+cPdSyXfnXIUureq0WW7JGrkn8Ti41xyncb9RJcWWoDVWDRcksiRK
         eilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046047; x=1780650847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgioJfiSLQsHNHryEgZJ3KiprT6RmzRs4G29o8NwBLM=;
        b=YuHpHFRsypw5m/Ov5DGARbHDdAUOJBCh4o3aKrSITDzmNafTAP2S3/aTHCeXLnZB1f
         OSxltP53llnKoS31D5MOJJZoA8A0cZMiEmo25JTAnoHmAz779yBuPmokKvmmW4TQwD6U
         wGeV84OXYEvm0Tf53GutyA0cFE7DMqVf8LOLqLT86AGnmSwu5eaciStrIKVDnszAg3x6
         QASvF8hqe0LufAPcO1bkh6tKKb12NS3wIf47Y2mIinXhXeTKV3x7gaKqOLA6O+LiBHKL
         NHCu94Zka6cg4ayEAsg//DAsPMRn/XqILmyCzXtOsxeS3aeHCHWVyxjfLsSDwe+TVa++
         OCIw==
X-Gm-Message-State: AOJu0YzLKqtB8LsGa8D6RTcOtENymE2xbgH6NSAtJ/EayGaf3pStTjJ3
	ISjwWzbpuAGV+/bgXIKFhgibGd6a+MCRHM578f+yZKUwnwutTf6rgoEPwwMvQE7zBrS9ZTHFLgZ
	x+R+ntihND0fs8xLRUC38MWeuj9TaVoH4bWY+8hug2w==
X-Gm-Gg: Acq92OElhciT7QQagiwiOmXW5GuGoYq6Fwoog8e/1YllykLAKG7hHkpnwHPl4OcgqC+
	VO0NwyFppb/OnYUH8vJf1Exv3aiP3QCC3gUgfnq2NlbP+T85sC8BaNLtwxekXXxBREtns1vw9DQ
	WgLDP+D8kNy2nWWT/gYZFDwRonFeml2UFGqAQKn7M3tFF+WMCjQJnH/zDUBfnVpjgYLpiFP20vk
	NWLkVuKWzjOXqxCBuxB5z7y1YHFKhTu9dST6Scj69XaWotM2tmaRfdf3b1xaf31n/Cs46z3ypWn
	s+HkJ+N6e1uXt1aZY4Wf1s5O5W/RIqd6bcRjMg9YFWvDeclll37V+fZBSCjV
X-Received: by 2002:a05:690c:e361:b0:7d4:3090:f0b with SMTP id
 00721157ae682-7de4de08415mr14916817b3.49.1780046047004; Fri, 29 May 2026
 02:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529034542.68766-4-laoar.shao@gmail.com> <20260529045446.B22791F00893@smtp.kernel.org>
In-Reply-To: <20260529045446.B22791F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 29 May 2026 17:13:30 +0800
X-Gm-Features: AVHnY4LCHaX_DNeP5KxXiVz7TX4bzbxuMHGIc8uMzprngzO3bgJFK_d57-n2_DE
Message-ID: <CALOAHbBGUkK+LnVy8236kje275LD43qoMRAKBgevzUnBGByiHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] livepatch: deprecate stack_order
To: sashiko-reviews@lists.linux.dev
Cc: song@kernel.org, jpoimboe@kernel.org, joe.lawrence@redhat.com, 
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The commit entirely removes the `stack_order` sysfs attribut=
e while only marking it as `<deprecated>` in the ABI documentation, causing=
 immediate backwards compatibility breakage and contradicting documentation=
 guidelines.
> --
>
> commit 041b2dbba1a7397626104dd773fc1f37228d382c
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: deprecate stack_order
>
> This commit deprecates the stack_order sysfs attribute for atomic-replace
> livepatches, since a single function can only be modified by a unique
> replace_set.
>
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-livepatch b/Documen=
tation/ABI/testing/sysfs-kernel-livepatch
> > index 6d75235a6a2e4..fddad93dba797 100644
> > --- a/Documentation/ABI/testing/sysfs-kernel-livepatch
> > +++ b/Documentation/ABI/testing/sysfs-kernel-livepatch
> > @@ -62,6 +62,7 @@ Description:
> >               are applied to the system. If multiple live patches modif=
y the same
> >               function, the implementation with the biggest 'stack_orde=
r' number
> >               is used, unless a transition is currently in progress.
> > +             <deprecated>
>
> [ ... ]
>
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index 969fea2a92631..6d65f839f4420 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> [ ... ]
> > @@ -457,38 +456,15 @@ static ssize_t replace_set_show(struct kobject *k=
obj,
> >       return sysfs_emit(buf, "%u\n", patch->replace_set);
> >  }
> >
> > -static ssize_t stack_order_show(struct kobject *kobj,
> > -                             struct kobj_attribute *attr, char *buf)
> > -{
> > -     struct klp_patch *patch, *this_patch;
> > -     int stack_order =3D 0;
> > -
> > -     this_patch =3D container_of(kobj, struct klp_patch, kobj);
> > -
> > -     mutex_lock(&klp_mutex);
> > -
> > -     klp_for_each_patch(patch) {
> > -             stack_order++;
> > -             if (patch =3D=3D this_patch)
> > -                     break;
> > -     }
> > -
> > -     mutex_unlock(&klp_mutex);
> > -
> > -     return sysfs_emit(buf, "%d\n", stack_order);
> > -}
> > -
> >  static struct kobj_attribute enabled_kobj_attr =3D __ATTR_RW(enabled);
> >  static struct kobj_attribute transition_kobj_attr =3D __ATTR_RO(transi=
tion);
> >  static struct kobj_attribute force_kobj_attr =3D __ATTR_WO(force);
> >  static struct kobj_attribute replace_set_kobj_attr =3D __ATTR_RO(repla=
ce_set);
> > -static struct kobj_attribute stack_order_kobj_attr =3D __ATTR_RO(stack=
_order);
> >  static struct attribute *klp_patch_attrs[] =3D {
> >       &enabled_kobj_attr.attr,
> >       &transition_kobj_attr.attr,
> >       &force_kobj_attr.attr,
> >       &replace_set_kobj_attr.attr,
> > -     &stack_order_kobj_attr.attr,
> >       NULL
> >  };
>
> [Severity: Critical]
> The commit message and documentation state that the stack_order attribute
> is being deprecated, but this code completely removes the attribute. Does
> this abruptly break ABI compatibility for userspace tools that expect thi=
s
> sysfs file to exist?
>
> Normally, deprecating an interface requires keeping it around for a
> transition period (perhaps returning a dummy value) rather than deleting
> it immediately. Also, if it were actually removed, shouldn't the ABI
> documentation be moved to the removed/ directory instead of just appendin=
g
> <deprecated> to the existing entry?

I will wait for the feedback from the maintainers.

--=20
Regards
Yafang
