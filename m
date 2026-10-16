Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C5361DB5
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136980; cv=pass; b=icV2ad+Npp4LhSrVL0lHmRomUDLf7UiLUpvWS8pAbueirTyDUdbFu9NgIllztvvp3ALxXnpl1LCGFj6VMSRdBLnIHtWZBmu6qTYFCVQY5ED2f1MsqB9fMA8g1MGzw/kzi9Zj8YR9TlprhVkA2DUeF5oVYQ1Lg217q7MIil3WLZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136980; c=relaxed/simple;
	bh=whnBvS+hjOpoEfJvISXHS2HkcWtJ/KX8D8iCC7vcpnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqT7ufsg7tsDnAGOtDfhrQr8Wy3/xznTnQ91F98DDUOJRH7tX5jha8seexjtQr0IkrRUjDjW6FGqBTciDtMbh2z6VPGtFZhTi3Hxu8g1wADZfCsbqyXIxXZmdubB2NXnDIDb5nOSf/yXmkfFglwnu3c2tbLehsSirCeWLZfehh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0TxO6Vt; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0TxO6Vt"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6798eb0d190so2230103d50.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136978; cv=none;
        d=google.com; s=arc-20260327;
        b=LFMWTwm2W3biNc3/e6+Be0YxcdAPEJPOzQuE2ejfBKTHn5VaSWb7LIZctfNlYPMdpc
         eWGaZ3Lammu4T3adi3nXkGNDRu14dND2JNreYIllo8VDpnvtzlcZh/JCdYeGR1sTmFzF
         7CQ6KU+VP1KIJ6V5ysrT/Q9jVqflwrC4LeeBMwSs9oe68nLaEhbf8W0Ufj0UN5IDtnfG
         j9+GOIspgGZK0XEVR7z8UW+000HeRwc6a1s9WEy0Bk6UycwXkF6xjqHU9keCJs/H5wb1
         LliaON3oKQE5MbUr9bc97lHBNOS2TGIefz1ClOVmRK2TiqGaibVJS+73FWItK0bkMcAd
         pzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whnBvS+hjOpoEfJvISXHS2HkcWtJ/KX8D8iCC7vcpnY=;
        fh=jN8VodyhAI7zYna9JzV1QjHjWbE/Mn6J5bWeUXC0oQM=;
        b=V7aqc8evdbFBYbuMQJWuebQrcbfRMXc+CTO+lJszLcPpz2sh6S/Eu/Bl+uXKJtlF4b
         Gfz0xzxvtT0aAwCvwciz65p0aJ6vypwXfmaiEvBqyyiwTGuJLMVpNseV352FjdT+Adt/
         Ly9tAs8iqXvCeq/LG2zgnoF/VN/bPa+Iky4H1hfJhqQ5H+IARaZXEOWfk0LN3hukPws6
         0eZ1qjyLOECVW5Jc+JaCCxfHgRn3Kl0Ait8lZ/tmnMFMbxeIPOmtOzPmZQ17fee8vdUb
         aqPi/kFrO1MKH+06Xx7Ba1YH4kcDrX5IRCQYydrK8cQnY5CcT0hHb0L8yw1pILB2v6qB
         43zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136978; x=1792741778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whnBvS+hjOpoEfJvISXHS2HkcWtJ/KX8D8iCC7vcpnY=;
        b=W0TxO6VtfYZ3peR4lER+2wGU2d5EDXr1pWW8kjeCpTXY8HeD8UpebnKbTBfYIZFKFL
         vYalz7mxpJZMK1+94RsGGwF0GiahhXBbRGKwhQ9vGv5oqnxWq8twuvitsPHCTEIq0qIW
         CWG9mWSp7+JEQoj+kOhRKGQjuxA4ZH7G7um7Ok0yLRBaJTq1z1mQ9VzAiFs9sBA/I+E/
         Yt6Yl4ABXf1wXnjoD7VYXYWJAYUBX1kIBikFeUQz9ZxDWY2k540hboWG+DjMuiIZDaxd
         7/WIhaHdXp19BWjTjNKwSymfA5NIV5CaGAMjq5caGo2fwCmA9+1IytmOTqqMu3RtN5sA
         ANbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136978; x=1792741778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whnBvS+hjOpoEfJvISXHS2HkcWtJ/KX8D8iCC7vcpnY=;
        b=pVEMI3lu++d1EaEF5sgV4oGcfhbXpou6sHJ670s225FB4oKFeG63k+tvk6O+qlIUP0
         fRuD3he0X1fMhUAFdoxpy5U7JV/KmDZrVpfS1cCnT4dAJFlFRwfxJK17vMTKSPVZxx1f
         n/HA/FYv713GLQ/ww+MjyhfmgpMZQZBVKWhgDhS/AJZfYMcH9MNJbk3U2xFkhsnzqddL
         NznwJSY0Xaz5ZUyDG3Flli8Ml1/5Z3DRvTJhqelui51NbzAtftCy1gehQPI38XtRLuh3
         7g5DDmaZRhnMUTKRO8OoIkZnh3Sum+ES9+4g2IqJ06aby2AdEs5qPw9XXMxuJiQuvnM7
         OkxQ==
X-Gm-Message-State: AFq9FYKuGn1YO00nfhQ024FVSafNnlF0UPInmXq2oh102e8nZNrWPnpO
	iKznnUz5rYRSfgc+fuVtY2B4watQOTCrLAkbo0pc3yNeU3VZ3FK6VVZPoemk5jMV6I3cPK5OO55
	uWpoLgQsd0VataBxQCnkf5+PKbTL+EYyOw0sJ9ys=
X-Gm-Gg: AYBFou3orZOZnQcJUQWzc3hVPIarqX+alA3HUR4qAmumJKHIhummH731V/T6E9xJUv6
	r5/6GwfmCe7hQ2HLJtIDh22AoRPNn4/oEGi/natldtvrG+5M03cqTA1vjWnBWhr7XKk+YSfNIIs
	QO94xMpdfBGqzG+M3RMGR/IAJeSRfsvL0HR2vmiXjZfJhIrELfvoGhSDc+oCjkUWApYJJfaj00S
	zEUMDhRiB//x3eYiq3RnFjBeZquD8JXcm5CALD5ip+DfRRCo9MXjoA0koL4+V2xTFMQkvPXaRWw
	cWNEo7ON02POytwbUBWouZskxQ5Kz9E2/gcUOnBuBcfxF9yB0pQHPslQ2Gf/EaMxca8c5DTAuFj
	RKiXSU1Iz6DduxQVjj52klA==
X-Received: by 2002:a05:690e:140d:b0:679:9e90:a984 with SMTP id
 956f58d0204a3-6799e90ab65mr2165537d50.23.1792136978099; Fri, 16 Oct 2026
 00:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016053708.47089-1-laoar.shao@gmail.com> <20261016053708.47089-5-laoar.shao@gmail.com>
 <sashiko-outbox-173836@kernel.org>
In-Reply-To: <sashiko-outbox-173836@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 16 Oct 2026 15:49:01 +0800
X-Gm-Features: AclHuK-Cuns4kegDALmYjCUNXS0KVVlvLsygQavt2shzotEo_AKNDGRd0fdPKDY
Message-ID: <CALOAHbD5QQVEXpoy44G9voXTn6rz3u8E6n0ZRV5miwSf=9U_aQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/9] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] livepatch: UAF on module unload if klp_is_patch_compatible() f=
ails with DEBUG_KOBJECT_RELEASE

This pre-existing issue has already been fixed in the for-next branch. [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng.git/commit/?id=3D7f4ca0d0b40ac1ccd82ebaf1514c2d26c3db71c4

--=20
Regards
Yafang
