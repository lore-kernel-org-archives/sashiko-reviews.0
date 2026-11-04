Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821326;
	b=pPrF5foVPc8IeA6+4ukGqhv6EBoizdni49fBAvsBzsZtY6R8YBmplEclPp8nlfA1vgcy
	 JJrlY0EGgZ54hb8FmPlLG+3r30u6SUcsPTtXYDs3bvdqizdDu/1R+hL/A9WRzMzrhwHnf
	 KdluKuD3ztaMWdwdJb/7jgfAqb2HmkYM+JHoBELBbSjye1J9lHa3kDx0jdG38YcXjm1NL
	 UeSacx4nfp/jETHeki0co+dSL3vTcuo5EvZ23JesjYSxuJ3AVYPT0uX8/1LT7dwm82FpK
	 IW6cBfasSI9w98ASmqjFE0exuJVWSjVgKjcrDbpNOI0CUnte6PQQOLUUXY9W6/uD6lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Bv+92c01P1xFA5T4dnNNXL4Yn3gyyGMmodh6TXZQ/F0=;
	b=zfLj/euVIlemv36yuxu8nitL1xCOJQNveZesI8z+7ioz9SjZVwo8+FlvIclOucOWhPi7
	 OU5pFhmAITokhRKIFQGFstC8oAQOyUQTerufvNCZWxb9jsdlp9qKESJTWlpHmnoe0e6qK
	 8KQ0KWkhTHguujfginmLGhy/iDzJWGQZC3fpysOFRCmkiq+b3DRxyKhxlj7E4WRI9CO+I
	 kXC3zd5vbXfhtApv18wVPcU1a86xuKQpfH9k5A5g0vQPcWDdELNwUcRFrq+e4iomacrzA
	 eknVODuoD5LjuZ8zjXhoqagBw3jahG/h1BWiN9C36bTMjMc9Y1OLn3+3OmAHk/x+AFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GdfxH+qQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94C6072666
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 19:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E94C6072666
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GdfxH+qQ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3fd91337baso200503366b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 11:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793821325; cv=none;
        d=google.com; s=arc-20260327;
        b=j4QosI6QRAxtKx1Ed1G0dY00fbriBBcweY1U7QvwYLu4zAcXeJVHP30RSNn99ju2Up
         afLAKg3e0NRYiZwkiDpU19Tfx/vxGg5faOMoIEYNjN//DngTJ3R3cIL9He47zQeCcTCg
         ar3WurPLa/0XRGtiWUR/q5ZGjWGY2aUt86EIfRUByEgMql4Js0C6k56O4eaMsOjx9kMN
         BILHSKfKHagV4KXgjisqc/PlwwG65hbzzivLUKfz3tDQ1Qo4fainFERn7VLlGsM7bbOJ
         1GTFUbcX60Zxgxz4n7SmGXxwo+TK5YlNCi6OHxqDZ3fK2JNWcjTLh1Smj/g3EdHJ2ngR
         56/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bv+92c01P1xFA5T4dnNNXL4Yn3gyyGMmodh6TXZQ/F0=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=iEhdWZPl3IbU01VH7WAEwarluW5TUR1rvKYsPtTNnitE3At02jR7Wrz3d+/iCsB+lz
         iBSm5qMOQZEfNLXCerpRThhHY5dK8krn0qnWXvKBdjx4sAazS2gWfmIuubtAX0bH7Ff5
         3WhBi3H8BL2DtakN2lpd8uhv0eznL02OH0Of3t/WAMb3Fj+BzW0vMJDvuxL9whRWz/jB
         N3YbxlK7ipneV0EdQSV7fRWN5APJL3t+BbeWhXFPH7oRdJKSdRWWCKmcWeC7Tox+lXZf
         FQLAg0hiDDtW3g4ClvBCB4jfKTYbkn1muWseGVHAZ2E75mBfxVW6L9kjkvn8O2ypPpYD
         JWMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793821325; x=1794426125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv+92c01P1xFA5T4dnNNXL4Yn3gyyGMmodh6TXZQ/F0=;
        b=GdfxH+qQYwsIEFizDg+JC5+m9Kbj6AejgrT/IHVYkGVewoIynVT4mS+dorDzF9lh2M
         0vgAjn36oYM3Q5i/JW8Wm1xaCFgFWQsNZD7fwTOcv+VkpSSC8N5minGVc2W50/jD/sIU
         GSloGN5JwoE4k53vUF2/ejsQMP+lsAha2W/JNDAU7dqTzN2X2yhEcyaBa7CSvgOocPhp
         zmntcaghkVGs0Rm30UVFWh57jtV1DpcJ/A4/MSkHF3hPMMD2pB+cdvc4NRqL5itDrIZh
         0Fj/gqqEE9vO8oFYCQV0Wkb7n1WyBDJMXLgHxPoRaWbBtBHMyzjwHRdpcpifRYv4lgFZ
         CfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821325; x=1794426125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv+92c01P1xFA5T4dnNNXL4Yn3gyyGMmodh6TXZQ/F0=;
        b=NOMuMj3LqIH3Tq6IYq6bqWATHbSZFTzvunchfENNCvr8KmSK95sf2d3esy5ucSiQB4
         JmpeivftXTpR4z/ViYMFqyD2w7PhREhUOlYdikLhdJHSOsxL4hvKLH6zMY7nkdDyjeXC
         H/XYuzdHlSE3wQufjkn/avD5nTewWWWiUzdHi8REQQzrpfgIMOwm5dMsr8Eo8HhLcMAX
         +QJM9Q1sUKtNQI0fXjO76XsV+swfMALgJkpDtyEAxj0DhK3sxnZz3ZQbvy1D9zd14KH6
         En9weS6JnzPlxnWLge4nEk/u2CwXJSW5NW+rPakPc/Udu2V0Ucp7yVnHOly4Mtju9ho2
         YUxw==
X-Gm-Message-State: APuU4Z/BvMA5FjyHN/+te6YK2cSyedHVRz+NiRtxcKHOeG5WPkuA43b0
	wGpf/yMLiAUb8yNmrvCldO7t9Vow8FV8W7NoizrfLvJQ4/88V3+sk/6Dg9ZBXIIz36wmsNwV8eS
	VjsdcjzrFz5UAypq4p9Ttv7pM24QabJA2kJLTxrApjwM5b5aV21VTAnZF
X-Gm-Gg: AYBFou0tqR/9Uxns5zhzsx97jslN6tWPc9PTYqcMDvSIeiCzdY99oCwCYELgI9xiYwX
	hA3CieK2hbtw5l9Y3rYLjSiCGbqr+DS5POFixqJAuLCDcZ+Zs78FOx/uWzLipyNNw2hr7BKb9MP
	pGD6KYnB3NAYMTUeqdHsgs2jQm4YC5spBPsrSxjAXeWxxAsyNik15guUtQQh4Ujr/SRRwedWyyn
	D8CX79x2Z269SdOwJEHXTC8p8EE30QcwETFpkus/Nr7gpyYPncqV67HB+u1zgUJI+R20NPWlug1
	RvKT4Gjlq1Nwtr6KohaIXpldj8x25YVQtWkPT8aId6jMowFPJGCMPrFSQyKC5YP27KcOa0jxdrU
	OAot50TK9ynyoIZqcommp/6xnqi2Ee3kA/Ajm4kvWSRtBWaxkTesIzt0Agb0=
X-Received: by 2002:a17:906:ef03:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c4ca7a4b5dcmr1479602866b.9.1793821324322; Wed, 04 Nov 2026
 11:42:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com> <20261103002205.3348519-3-dmatlack@google.com>
 <sashiko-outbox-194380@kernel.org>
In-Reply-To: <sashiko-outbox-194380@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 4 Nov 2026 11:41:37 -0800
X-Gm-Features: AclHuK_VLO359ovTghTiGGyUy0_jJXc-n2zdfwttkbViK28RoUHrb7gt43Eq9pw
Message-ID: <CALzav=eZuhAFoYm5s8j9ei+6Zhf7zAWKHXRug+No9o0=rHUypA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] vfio: selftests: Skip tests when the IOMMU mode is
 not available
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Can iommu_mode_is_available() return true for iommufd_compat_type1,
> iommufd_compat_type1v2, and NULL when CONFIG_VFIO_GROUP is disabled (for
> example on a cdev-only VFIO kernel with CONFIG_IOMMUFD=3Dy and
> CONFIG_VFIO_DEVICE_CDEV=3Dy) or when the vfio module is not loaded?
>
> In tools/testing/selftests/vfio/lib/iommu.c, iommu_mode_probe() only chec=
ks
> for /dev/vfio/devices when !mode->container_path:
>
>         /* iommufd mode requires VFIO device cdevs (CONFIG_VFIO_DEVICE_CD=
EV). */
>         if (!mode->container_path && access("/dev/vfio/devices", F_OK))
>                 return false;
>
>         fd =3D open(path, O_RDWR);
>         if (fd < 0)
>                 return false;
>
>         available =3D !mode->container_path ||
>                     ioctl(fd, VFIO_CHECK_EXTENSION, mode->iommu_type) > 0=
;
>
> For iommufd_compat_type1 and iommufd_compat_type1v2, mode->container_path
> is "/dev/iommu". Because drivers/iommu/iommufd/vfio_compat.c is compiled
> into iommufd unconditionally regardless of CONFIG_VFIO_GROUP, opening
> /dev/iommu and calling VFIO_CHECK_EXTENSION succeeds whenever iommufd is
> present.
>
> However, vfio_pci_device_init() and device_init() in
> vfio_pci_sriov_uapi_test.c route all modes with a non-NULL
> mode->container_path through vfio_pci_container_setup() ->
> vfio_pci_group_setup(), which opens /dev/vfio/<group_id> and asserts on
> failure when CONFIG_VFIO_GROUP is disabled.
>
> Should iommu_mode_probe() also verify that VFIO group support is availabl=
e
> (such as checking access("/sys/class/vfio", F_OK) =3D=3D 0) when
> mode->container_path is non-NULL?

Good catch. I will add a check for /sys/class/vfio in the next version.
