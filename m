Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79894D7D54
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598612; cv=pass; b=QSjfZvauGQSZZ4amuFtQC6MWy7ZDUoZFd7XHBCRRVzDL1UTdTqJs7PTWNZJ7KmlVy7wUKNLa4Y1HddkAS+GfAVd+b4mlUE7NhX0uU0QlCb2DieHlcg256rTvwIGCG6IXB8O8Q7ge7y+MzG2vf8/WR7Qa3Lmgh5o/DMx4yjtX/IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598612; c=relaxed/simple;
	bh=SJqE2m61PGfreD5RH9QiosfZEfJfLRRLLr6K6HnsFZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4TpBOmeWQjmo68o59GfWU3eePP5jcNAnh6t/nS8dPTCTEL2C6srncSnPtSTV6A7ksaNqpaM9elzhNq6RorEX4SQGxrdhxwgO9Whlp68w5xZ+aa/GObK2dl8nCsRoTRjdcUsJUskOdp3eVOf04YxITzDM49zdANbRDWGSgaS+cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN2TA0qt; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN2TA0qt"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-6713d20d375so233520d50.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789598594; cv=none;
        d=google.com; s=arc-20260327;
        b=WcgjeTi/w3HMfg+XoFg72pl2eZFSSYVfAzMoIcwtjt+vdkHmLFglyZDDaBmcsB4q5i
         QG5TRwaYw+ew4TfJHy1T3D0v2DR1pZh7dfxtF60DcFu7wICZz+5kNtV4gc+J+eg2JYTA
         GH/jNmMZ7Ndi4QpNNnoaKlZwA1BpbRFEG77XE/BpbzdMB/oViDlqoJYQTnIJFLYJuDFW
         WAMdhOkT8p5PtJFlEWhAB7kq+yZqyJwAwwvK36zQtc5fe6ZZ9EF0SrFO6+8V55/i/L//
         om8Eob8Y62ouffIvpZP+5MT7SJfkE0jkj96RBJfm6pKOGHRjX3KidsJqkCryNhHRb+ss
         glHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VP1gHgdIqBe+kEh6BoRGZQA0vXfJ71qE3TipRKbKn80=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=PuOAJUsYSDmQt36C9xyW1kawEw841Hj2nvHdo+ItSrdC+GAbIM2Y7Xs38zsKJ0yqXa
         sBaEL2oDGJQQOyZpWCfZi0kOMT1VvvEuaU6YCPRk/1t8kpoJ1IsqQeJW7GfUjoMCe4lt
         zvTH0tdM0sr2rnHvtHarfOdlRGoymFuAsSUZqD+cY8+aoWgcnGS+YE+lGkQwKC/UEp7V
         1+zerRpdfxcNTsBCD24GE4AIWSxJ7ZpP3sCUXbjd0SeUia+o4HUINE+udUTb6Qcsfu5A
         9sEJKlEfdhDkpn7N/7EGeDhaio+kEIIpqwRZ06khjldHvMsNJdRen8ft7eLZCWogQ7/w
         0/MQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789598594; x=1790203394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VP1gHgdIqBe+kEh6BoRGZQA0vXfJ71qE3TipRKbKn80=;
        b=eN2TA0qtcj/jxeqK+nWBpYHC9YBQ7bIaIFrUIcq83r1pmiMs0i9Ty+4AwfeM5zlQNx
         sl0xpdoqTibZso5qI60YPKVoPv4NZxzwZRp2CufwdrGO0sGhKQRMWfaEX8WOLSF/qoU0
         gIJgaPFUAnC6fOZ7tuP8ZZl2EIujDhrzsjOZmu+mFGEI/NxRA79U504z9HCbCHkCxVuB
         1VWMwvLFPQQSBBhg5gZtCOzJxA/rT4BYiZ2lRsl1u8Yw8BMS8ILh6f/gz1ic4nn3KcE5
         N7oImW5D1BepXE3UeCC0Qo1GJq79bwxC9olqYRsBzD6YuAQRPLcI0Fh9dkMJATaY0Eri
         rozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598594; x=1790203394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VP1gHgdIqBe+kEh6BoRGZQA0vXfJ71qE3TipRKbKn80=;
        b=ACLShnOcbCNz2ccggTSGUyeYl0pB47NocnzhN5mRyNwDz9n4iGaOckVqqj1uEO5AVi
         ueQnmKBHbufbBm/Tiy7bWQ1eIn+u72dIxNa/BOi5q+LvtQpHtuRb1wAQagsA97tphi/x
         VOAP4zRivZqhbF0N6GsFq1Uod5QaicEzjWVLwQ7fSmKm8lStQ8fSCc2ra9AfF51aAjev
         OnzKH8oOtpnCXinSvUndOAPreplFhhB8lD+RVsiuAF8A2BtTV7Bhd+rEAev2HGKiiWYw
         Z/cMV5WGmROhB0cIg/3eCFew7lKMK1GAwnBKDpKaUd2NNSf2oMZLdSz+uMWKkJbBr346
         qlhQ==
X-Gm-Message-State: AFuF++mKS/ClGUzeKVM/aCxCpDXKTueZ+YBVVbd8Jv8QBxO/703Uc2xl
	ZGhwa8XoEpgVFaQzr1cHEoYrui4qhIWucpTqHxi1OsGZlrmBJv6W6t0e30ExPFWq5NGWzEMhuBJ
	/3Y9FVMJ7vXoZXDU7eRCslR9ABe7svjZTgTDi9KM=
X-Gm-Gg: AYBFou0uXbB6GB0+EB5BmUOH0ta2+9dpwx34a1NqoTlWB3wdfkVSmYahjWaf4at1Nyb
	YyXm5XZNR3RNacZ7IynEfKowOPRHBGs94Fphu9Io+/AkJcZYf1x+7nhAq3j56wp93rrnQSHmMLj
	DOH9yh1yqNEIyvjMNfjkng9+mNaMnBu8tRhp1PGwHNr/x5PFbp6UQRWEd8ojKLaTyVYp+7xjlAM
	vHZislafaHHJZi9lEaamMfWHQ4BywHuJx7w9oHi2yMLQq1MjxLDFN6T/j4P2G17XEoptA5AZC6c
	T025Qkj39oi2KacpwwxhbhnANwI7GyYhAZn7tjyJM75auWOUTtjiav7K+ko6J84Zg0R9+Nn2ZUC
	36QWOAyB9Fa+nA4lowBllX9NvC19eTaenHw==
X-Received: by 2002:a05:690e:12cf:b0:671:23cc:8561 with SMTP id
 956f58d0204a3-67163201b32mr1574386d50.31.1789598594536; Wed, 16 Sep 2026
 15:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-dd-cmap-part2-clean-v10-0-af4cf4767707@gmail.com>
 <20260916-dd-cmap-part2-clean-v10-8-af4cf4767707@gmail.com> <20260916160018.DC5F61F000FF@smtp.kernel.org>
In-Reply-To: <20260916160018.DC5F61F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Wed, 16 Sep 2026 16:42:48 -0600
X-Gm-Features: AcwNN1WFvT--q4ESZQXCY7SHYNMTMZrDrc-ogrmqFQnSBAonjPHMrZUlFUTsghI
Message-ID: <CAJfuBxzygOtC5DRjiioX3EN_pc_33dt9diNtoW7G3KiMqy_edg@mail.gmail.com>
Subject: Re: [PATCH v10 08/38] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:00=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] drm: compilation failure due to DECLARE_DYNDBG_CLASSMAP stub
> --
>
> commit 96b109d4ffa1bfc809c49d548861d8dd8aa48aaf
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
>
> This commit moves the DECLARE_DYNDBG_CLASSMAP macro definition inside the
> DYNAMIC_DEBUG ifdef block. It also adds an empty stub macro for builds
> without dynamic debug enabled to provide a cleaner starting point for
> future changes.
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 05743900a1169..a10adac8e8f00 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> [ ... ]
> > @@ -314,6 +314,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor=
,
> >
> >  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
> >  #define DYNAMIC_DEBUG_BRANCH(descriptor) false
> > +#define DECLARE_DYNDBG_CLASSMAP(...)
>
> [Severity: Low]
> Does this empty stub lead to a compilation failure in the DRM subsystem?
>
> In drivers/gpu/drm/Makefile, CFLAGS is used but ignored by Kbuild for
> subdirectories, meaning DYNAMIC_DEBUG_MODULE is never actually defined
> for the DRM subsystem. Before this patch, DECLARE_DYNDBG_CLASSMAP was
> defined unconditionally, which masked the Kbuild typo.
>
> When CONFIG_DYNAMIC_DEBUG=3Dn, CONFIG_DYNAMIC_DEBUG_CORE=3Dy, and
> CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy, this empty stub is used because
> DYNAMIC_DEBUG_MODULE is undefined. This causes DECLARE_DYNDBG_CLASSMAP
> to expand to nothing.
>

CONFIG_DRM_USE_DYNAMIC_DEBUG is currently marked BROKEN
so its not happening accidentally,

And the following is guarded by #ifdef, so it wouldnt happen

> As a result, drm_print.c attempts to reference the undeclared
> drm_debug_classes variable, causing a build regression:
>
> drivers/gpu/drm/drm_print.c:drm_debug_bitmap() {
>     ...
>     .map =3D &drm_debug_classes,
>     ...
> }
>
> Would it be possible to handle the stub expansion differently or update
> the DRM Makefile to use ccflags-y instead?
>

that patch has been sent before (by me and others), it hasnt been picked up=
.
I will send a full set separately,
insisting on it here is cart-before-horse


> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-dd-cmap-=
part2-clean-v10-0-af4cf4767707@gmail.com?part=3D8
