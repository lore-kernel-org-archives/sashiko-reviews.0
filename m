Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7493B5847
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162069; cv=pass; b=P939/VOM81v4a0RjjghBExsflFxPXQY0F3tkeyg5ilRnhG4osAC+io+ZmdEmUGkdksD0g+M03OmU5BsPYMPh3zqk9yeOu+SAlAf/HHpQW5U2HEbtIx+aiqmaYqrYySJJu2D8MFFVNOgbCdFq3k/eXR1PvNNPVfVLJ9bdMdf0Qko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162069; c=relaxed/simple;
	bh=LaLu0ei2yC0WN2S4l4Sm1HIA5UTS3G0Rf2gbgD78kYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0OYrN7N4sxR59p3mHU+54RfsxEK39nBlwb/ULnWdIaB5ojesZSgkiODXylJhf8JQCKXISmdwqf2jE37Flrx8oxwaMhrDdPqKSDwA6I39lK/lFDqCjVnMQ6EkaUe7bQ2rR9O8/Cot7ScARUHGQefoiZRTbeDzb8V11p1/eqRaf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrz4v9O0; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrz4v9O0"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66062a414fcso8474856d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 00:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781162067; cv=none;
        d=google.com; s=arc-20240605;
        b=FjpyrTNv2lhSIgWV8Gh3mOy04B4oaG7R8cKvhLVEgQXe/dSQrjz3yNqJkgEDSAoBxi
         SSxfcD4rhhehLSyFYDlEkhVfSe3I1ATelwLaNEKcEsoznjBN3E2a5jVn15YMsjwmXsCp
         iU/o9W/bEj/F3Did8WGHS0VnERNT5xQ9hmLZEORq6g2NvJUW04A22/2w/oD87yQumd8S
         JjgL3QBpYwGdYkrd6iHx6I+X0d+3Ebt5gBUnYE+d7r2ki2zrm3pr6lzvREgubtX6tRol
         lbZbnxhs7nNvyUlzVF52S2cckAtffqKCFQPMuo4Fzmun7bU2LNnKFw/SxL+pZmqlbLM+
         gYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjwvHah3OGukX9xzSqK99XscYrnIt8dls7UMLocE7GE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=lhKb3cjrS9gnV1W/BA31FnQctYb0DqM9JniGJO5Rp2x843oqsmO6F5C51afO1bueXO
         gnYqBv4BJn6YyEQ4C5Z4gSqUUQxs0TAgkgOvn3zRh2yUXjK7Ba52tGVt1vd3KKptGT+s
         XY18aP/dO9wd0inE7I5waJjAarZ8emlcq+MTjEuBXNqQLAIKSpo28M6Wjr050F+XPyu4
         sScBISFGxHLAexG3+BTGuvtotcOF/MuWP5Yq8j6lCH12f9OgsmMvQ6SGI11xCWhEukHg
         lcDRJ5hc8l62IAmLJdlFG6tRUJhoIiMF9k24NOHWx26jaPKymEb5bJwlpfGyVF7MuJvd
         l57A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162067; x=1781766867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjwvHah3OGukX9xzSqK99XscYrnIt8dls7UMLocE7GE=;
        b=qrz4v9O0mLzM/MQjlX++OoqG2nmG4HjPPn3AOBXznWSdiK17x/lTqiAQKxf/t4TNwn
         goQDD+cyFrz5j7216+zVXFCg/a2z0kAGzNF6AKeSH9vQpgpHfFZIXZARcJMlbxKlXLJ3
         1CVDlvJqf5NHg0G8ljsNjodV9Iw14OLg91LX+YkFaGkVMQxYRewh8MAdPM8mhHB27x/s
         oBUT4dGCkjpEhU+NGbxXPziefZqxbKu0HLYdopLL7lkgebP8gddjIqNKhoFVkxMHR+mp
         Mq5fU+EgvDAGS4w/l+aTO7kcqYegaM1UetxKyd2MLxnHlFbMZWM2sXBh8sdLuFFjVxI/
         wHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162067; x=1781766867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjwvHah3OGukX9xzSqK99XscYrnIt8dls7UMLocE7GE=;
        b=SG0HJJ7QYBSgSP1r3LbAHYme3Hl4qNJzkkGMZxYyCjkhRfyjkOa4tp9EbQZWYUGyrb
         gu0YFq/bl9MQKADze+XRidjxuqjmpNQ+gAc2sELWOh/CKGvZwht4KHzERDN+GScg4gL4
         cS/dSjC+SY/Gn3NdUaprINyt5y5ZMcKjrIiOuzUV6bxGpiywltQQfX2McW3KU4VPlHDS
         +PCqO/2sta94bVTRpu5Bfdpagk06JFE3AbtmMaSMivgjn4vBkUm72jtueLaZYxsbb5r6
         zO/6XAmBOfwtdZ2JUjo6tHBFpfDuDs6F8QO0EWLwiFzDg6U6TF+sGgECHaS54xUmLzfo
         pX1g==
X-Gm-Message-State: AOJu0Yzy9H18+b0cTiUqihr1zHiBpfpIwmAjCeLSPs25K511vxnMeFXr
	NV+W/S0RPKihGG7XrrkBKtYTUnn2RTG51sUnTemuFXj+ro4uxYaHTGq3bNHWH9dk4+u2IIwXlGf
	9Zlr4kjNfFqvxX18NWdEug8mK1MiTcLiSjv4FEj5W1w==
X-Gm-Gg: Acq92OGhJ1m/aSwmkk8t7yNcixSZzf6/2jWZcBZxWXB3UXnqBvfXR5ai+AEzvuKmEZr
	9QnMHz3hWvQgvwfc4bI4Ji9zr5/cid8hB/UMbXyCUmo9IYQcJ8UMwrVobRYWRhCCqecf81wq3w3
	4lhxrdcSkKrpSGqx5CHH6Tkt+aKwmQPT5sPDtVqLYtDP+hoUucY1/GJA9WlY1st+Ld2/pKWEk4L
	lALCbBso4eI3f2XkX5L14E7gKZb39mRLepGHa0KzOmj2AC8zlEprmypnx4XhIY924jncZoKjISz
	B0eE0Dc0XK7Lu3rZWdmSaY73Ub2PBno9l1Gvxb3dBeAMi0xA0c8YmLEzeih4v7F+YywcYvTGK+x
	xjfUj
X-Received: by 2002:a05:690e:480c:b0:65e:20b1:e963 with SMTP id
 956f58d0204a3-6626986c14amr839447d50.34.1781162067120; Thu, 11 Jun 2026
 00:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611043317.512843-3-sun.jian.kdev@gmail.com> <20260611044722.174351F00893@smtp.kernel.org>
In-Reply-To: <20260611044722.174351F00893@smtp.kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 11 Jun 2026 15:14:16 +0800
X-Gm-Features: AVVi8CdTMjhN_TbxNVF-V5AimCd7-pfZXPvv7Jc7KtCcCcWlkevfdchOdbxr8so
Message-ID: <CABFUUZFGa205D7hAQiOK6h=Y6iLaiDvBU=8TjQObtcqhf0=Lig@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Cover generic devmap egress
 last-dst rewrite
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Uninitialized `net_config` is passed to `cleanup_network()` on e=
arly error paths, causing arbitrary shell commands to be executed via `syst=
em()`.
> --
>
> commit 60bbc3bd1e74368d2d682d8956f86b733750dfd9
> Author: Sun Jian <sun.jian.kdev@gmail.com>
> selftests/bpf: Cover generic devmap egress last-dst rewrite
>
> This patch strengthens xdp_veth_egress to check that destinations observe
> the correct MAC address for their own egress ifindex. It also adds a new
> generic XDP last-destination test to cover cases where earlier destinatio=
ns
> do not have a devmap egress program.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c b/t=
ools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
> > index 3e98a16659362..681415cacb75c 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
> [ ... ]
> > +static void xdp_veth_egress_last_dst(u32 flags)
> > +{
> [ ... ]
> > +     struct net_configuration net_config;
> > +     int mac_map, egress_map, res_map;
> > +     struct nstoken *nstoken =3D NULL;
> > +     struct xdp_dummy *xdp_dummy;
> > +     __be64 last_mac =3D 0;
> > +     bool found =3D false;
> > +     int err;
> > +     int i;
> > +
> > +     xdp_dummy =3D xdp_dummy__open_and_load();
> > +     if (!ASSERT_OK_PTR(xdp_dummy, "xdp_dummy__open_and_load"))
> > +             return;
> > +
> > +     xdp_redirect_multi_kern =3D xdp_redirect_multi_kern__open_and_loa=
d();
> > +     if (!ASSERT_OK_PTR(xdp_redirect_multi_kern, "xdp_redirect_multi_k=
ern__open_and_load"))
> > +             goto destroy_xdp_dummy;
> > +
> > +     xdp_redirect_map =3D xdp_redirect_map__open_and_load();
> > +     if (!ASSERT_OK_PTR(xdp_redirect_map, "xdp_redirect_map__open_and_=
load"))
> > +             goto destroy_xdp_redirect_multi_kern;
> > +
> > +     if (!ASSERT_OK(create_network(&net_config), "create network"))
> > +             goto destroy_xdp_redirect_map;
> [ ... ]
> > +destroy_xdp_redirect_map:
> > +     close_netns(nstoken);
> > +     xdp_redirect_map__destroy(xdp_redirect_map);
> > +destroy_xdp_redirect_multi_kern:
> > +     xdp_redirect_multi_kern__destroy(xdp_redirect_multi_kern);
> > +destroy_xdp_dummy:
> > +     xdp_dummy__destroy(xdp_dummy);
> > +
> > +     cleanup_network(&net_config);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this early error
> handling path pass uninitialized stack memory to cleanup_network()?
>
> If xdp_redirect_multi_kern__open_and_load() or
> xdp_redirect_map__open_and_load() fail before create_network() is called,
> the goto labels eventually reach cleanup_network(&net_config).
>
> Since cleanup_network() passes net_config fields like ns0_name to SYS_NOF=
AIL
> which executes system commands, could passing uninitialized stack garbage
> here lead to unpredictable shell command execution as root?
>
> Would it be safer to zero-initialize net_config with `=3D {}` when declar=
ing it?
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611043317.51=
2843-1-sun.jian.kdev@gmail.com?part=3D2

Thanks for the review.

I will zero-initialize net_config in the new test in v4, so the cleanup
path is safe even if an earlier setup step fails before create_network()
initializes it.

Thanks,
Jian
