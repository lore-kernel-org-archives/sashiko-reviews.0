Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8422765D7
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268301; cv=pass; b=DMLChrfITpCoBhHek9Wmv1W++KyzqoEipAh5SNcCbviCkGmLhKV1O1p3NxCqmsepnTaeJAmn6YA4WS8gkKnirLISl/+a8SflJEICAkrN4yvQNrczWHqDaQP1EFXVHLW5Ez2DhFPi51z9fQoCAlB2Q7pEWhM9C/NIINtcSNJ6FEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268301; c=relaxed/simple;
	bh=5UzfQdz5mP5ZZyzhPDmxZKIk9wApiMAHPpeiQGwrQhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InT8jKDF4W/24zjUT33t9QLgG7aba6+a+prNgCM+er0hCGasSa1ocfkboiXrqUmTzlWjoDxG+VI3pyKn3Ci67n9J2h3XIT8XxZZAIk3E8dZBddAWa2jpphXV8b2xefkPhTG/VkLZki1uM1KgCkIbJUU+1P0s7HE4laG/x71W51o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnoig31p; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnoig31p"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so851884d50.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 19:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789268299; cv=none;
        d=google.com; s=arc-20260327;
        b=pR770GmC7GzQIPE3UuMb3cC3KcWd2IN+2K9rIS86dmfOfHNe4W0OxOiU58+t5coMkf
         2y9JErFd31X/5mTO1HcTmaBFIOcPEp/FIAF12tmVBmzfeT947h2pnQs8A9LuO5BIP3Qp
         IypUqxy+gxKIl3FIMAfGAQ34/9vEwvNinPXN8CWEuT7jWqQzvomT5khjglU0EK5FeLtL
         HRaZ6Bjvf0ycwM3fyF/ggTLMr/87njmIsAi31S59nJns3QsD7xnpgJkK3/79jZFS653+
         PE9rxmUqhTk+HoO9G3dowIVzAvJY1uIYLaJDh+3JMeZz9v5Vfh7xlo7Z2fh+h3rjFYCi
         q51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+zsyyUWoZeuEsNDePtAyeDZ8FoEK0FwB3reAh1f/WA=;
        fh=IyoxqQbaumxCmADXVnF0CnJRjr+y+YwYqlcBVFj1eoI=;
        b=e5yss+FJASq/L931/2uXu6zK/SgxEpGprN4AObhzoj4i7VdRhTcez4j0ygZoNtwtCH
         OFIPLzRu5wS6bDRoOKCExElCfCuSwVicgKsT3t+26uJ4ufJGXPKtZCOCv6HqhbTS6rUN
         llnwxcOn4yjC0rlL1ZqFISOEhMTP0qlE/4HJRQQKsp/bxx29cU8ny13Xh9SgKB0kJPd0
         KaE6Q7klOlSibuz3+gS0KxuNfHrkBomBQjgoDc4fgNBSeYIsuUFaJy0+SPYJgw9lE/tA
         g5Hli6NkWBQUr3rQYHpVNNh2V+qObGc/QefQ8EIpmdPXKvMzjrGHDOIAhunAgMzHzerG
         WuhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789268299; x=1789873099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T+zsyyUWoZeuEsNDePtAyeDZ8FoEK0FwB3reAh1f/WA=;
        b=Fnoig31pOfCthGAk1civFXi+StacIGpeqNieOH0eTBvaOZbHNm3OZNIJ8ON5C3scl+
         JWAHrIpwPbt79fDu/3LUv9HSVw9EJZzW52sjgBHSpdz5rFE3eiwvIK2JDAHI3PjT0T5C
         knJJdgyxb2xd9G4vOMI+TX51DRFf9Xpz6gq0xGCB38mFxiauOHPL13CPO/jyQOcPppL8
         dVD2BbYRjj5XPuwqg2NLEpYiY+FSTIwcak461fXXvomipQ7JUopoejjqb2hNkrbvViMD
         cgLWpZXSUvmFKIRAIUY2JyqBC1BLBtW0bxyCuPx2rxFX2C4rOm9L1Bmc0vbFXJ0RUytx
         H3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789268299; x=1789873099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+zsyyUWoZeuEsNDePtAyeDZ8FoEK0FwB3reAh1f/WA=;
        b=I1k68MVBZcdpl10I4lvxcYneyLwchqogzeKqOQYpXbvO8bS7bt8GHgjS+sKUtJBvrL
         xQhv/bum+BOhxeWrmmuvq9DSISJLQiT17XnC1h/Ph79Fq3AKTZvjMnoS0EuF8cZv47QL
         sU7zgSp9AKNNaFaCq2bfhPJMLJ7c4jQacaefrorHLOKRvtnvfQN7fOreetJhnXSCezQI
         Umb9Bw6/grxO6DUzatmD/PBjmL9fIdmptihrB9Kc889Vi9L/rXXP53zhbIIR4FFZk6Qq
         cqe9s/9lkJf3gvVBbsby6jNBQWT0TgxcE5JvT0ZBDGuo9xiNOw/YGDBe+4X031Cy3bIP
         NqlA==
X-Gm-Message-State: AFuF++kd9SSrh89rfxKKo71GpEqVNx7ODyPprXAvCXxCcrHEJJNMZxlc
	fQFFYkjXaYzGhKJGpUkACTu5+6BcBCldhjXdLaiKeRwbGZC4LBvXTkfiF2UbxOdYZLclOvECtbz
	JgjPioRx0r4hiedA9UZrW+i/lETp23jRobLQ5
X-Gm-Gg: AYBFou3ceG3o/SSttENiH5CQ9/VNZfl1apVHnMFHd5OqNHFsA5y0xxf32Fcu4SlmsYC
	gwggYF+FfMjWavmEND4EwMvh9ZXbCfmo1D4nNtzb5UUxYMWV2fjZW8Y6DUqP2RwUzdb24uEfTzt
	BBxFSCI00GI14VwvZ5WzzBmDRfpyXu459ihR9zUVi3Lw5lBy5GUNUqz0OaOCEptUsSLhvSHrCP/
	ZmcgW/I66LwKsA/DKVA6I8jZmtH6S1RqdCbjNFyhBIoaB8xEHfyF1ojHqAoM9ET7FXHt7MuhunJ
	atWMf3oKSzGWmluGokmeSD2DOjwp7vvWcH+B3X3JwIX+0vmuva8RhTsUlN8tKglWMNHp9zNcB8V
	rO9PfUg/K22Uk
X-Received: by 2002:a05:690e:134b:b0:671:3eae:6dbd with SMTP id
 956f58d0204a3-6713eae70a5mr912664d50.5.1789268299098; Sat, 12 Sep 2026
 19:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913024228.72317-1-laoar.shao@gmail.com> <20260913024228.72317-5-laoar.shao@gmail.com>
 <20260913025505.D1F501F000FF@smtp.kernel.org>
In-Reply-To: <20260913025505.D1F501F000FF@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 13 Sep 2026 10:57:42 +0800
X-Gm-Features: AcwNN1UFs_X-Jm_BMmrMmGrVOj_gJ1eaEM_SnOPMja5balftl3GALAtjTI952IQ
Message-ID: <CALOAHbAffg2hfKp0YoQ5V1rYHBqZ7nh43rLiC8k5vsr8tW_oLg@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: song@kernel.org, jikos@kernel.org, jpoimboe@kernel.org, mbenes@suse.cz, 
	pmladek@suse.com, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:55=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Use-after-free on statically allocated kobjects when CONFIG_DEBU=
G_KOBJECT_RELEASE is enabled

As explained in the previous version [0], this pre-existing issue has
already been fixed by commit 7f4ca0d0b40a ("livepatch: Fix UAF of
unregistered patch kobjects"), which is in the livepatching for-next
branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching=
.git/commit/?id=3D7f4ca0d0b40ac1ccd82ebaf1514c2d26c3db71c4

[0]. https://lore.kernel.org/live-patching/CALOAHbCOFvcDy9kVVKRBAECnDi-vRcw=
h=3DdQQSC0ENeVxLYB_GQ@mail.gmail.com/T/#u

--=20
Regards
Yafang
