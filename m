Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFC3E0C7E
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782332542; cv=pass; b=CHLoMH0Y0Z06V/JYCBUelAW8lLsODyGlCDcIgiyxvc21e58Di23pRHUKrSQtd0XsEp907dn++heag2DkkFh1WmUT7a5m942tF6EISumOpJGH7t3u3WWxBzFPHSPjDj6R1Ah4/bvBQLxnMfUFQqh0oDp6Bj8sCjs//TEU5eWpqYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782332542; c=relaxed/simple;
	bh=BtjUuXZ73D/qyp8VKn6KPfK6YXmAmDeXxF1Yp71qiyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ0q0hgXJr9YhFzt9vAgacEhgPavqnFWVhb3Tv6NTojgqZVkE9R9biWygLLfAcPwvEUtD75xfcwoXfP3Or1bM9OEwIc4m01/GDn4W79XSQof4wdsWtAUqmIQxeAxTFudj/eXfGjb2++RJgrJY/I70BBTv8ah/Itf65d6yNjkhVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJpJMEHE; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJpJMEHE"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-663b9826fecso1403169d50.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782332540; cv=none;
        d=google.com; s=arc-20240605;
        b=DH57eAYRRbRLAvaDTx7qlfKnR3qYByIRcfLLkJVNB7SslgbIg2Q3ITu40mRIayGMSZ
         weM3IbGXStM2pSCMBe3qSe/uKBxmJayQgCQkGrP03WIpyjRfy9qUDSwtSPiU+pW433yL
         lm1k+Oj1RSrqBXpWRJtjTe6zo0YqltCUhQQ4AubnlgAYBYv7n1R2efqPT9uPrdbkuOfP
         o8dfiF1TVvvtm7ZkdZ5yu7XDeacWkAHuGj7jCNEsvVVO7gPJpAjmvzU0UFBzv/Xn/8Pm
         UwqM6nX262Gi8jJzzW16Ym/WT2xFFgBdCKN1+qHGySqOj2KjUgsvbEtMFUfPcWr+MCYa
         V3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fNe75pW3ZXrVsmALyOE2GE0eISHbsPXr9AeMBKq40Eo=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=V9OD2NqKcXqQ9cWyovxSspzwbS5xwFYVVGgA3XnQA9Le5LxoTNFEw+jgNl5hlpSYnC
         KxuQoGFq06YixYytdc7JlHNnVGgabKCoKKzf9i0yZS6QxJqY4OBzrT7i5VA6dY5xUBRu
         6mu6yoH00kzZ/fiRB5CIJUFqjbkgSNSW3YMgN4xeuvbnIZJHVqcuH3qNOUc1C22WQFfE
         W0M/5HDQ5q4ezXXymwXEVVgsu1bPIiOM1G+ee/sVcFHXQ/KvvS8xs5f84rotVt3UIsUR
         qY5yPExxs463xRNUN9LSkA7PlTeKjT6I0koZO95db3Z+X+klpz1iIzFwIMyvni7PZbCY
         9YUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782332540; x=1782937340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNe75pW3ZXrVsmALyOE2GE0eISHbsPXr9AeMBKq40Eo=;
        b=MJpJMEHEFAfevxM4VokY9ru+24Wd7JUpxfJ4K/d87uYds7zB+0d5AjixsG6u0c0XTV
         dz56U8nVR/VFAwGO/dcopPnSmyLoBlUpi2PYMJZbYLZ2FcFrTqJGJ9ELlq0nog2eCO01
         1TiR6wgow6xq30UaIle2atrBQ8NTfXOcBpmuwksIFC0ed5PVTXVeliXQFBqAQesaTNFD
         tpni/VSToZ7pe6ocZaUIIwbLpuMP8NEZi485nGFxU27yROcOuNowkM0/T4dOEoLP22of
         pUtCkAkai1esUGe39dvpRtkKWEA46km6TcqVHJEaVcI5fJpjCWZVovM/srhz3MOYdhw3
         a/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782332540; x=1782937340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNe75pW3ZXrVsmALyOE2GE0eISHbsPXr9AeMBKq40Eo=;
        b=BpDVzYzaKWZskjYZNhxYSosFCTEtpALUcIa9KcB63bx8P2RwReWzqNJL4x6oIRICtR
         /B0N36DknZDlIJB4tUJP6hpj3ireNMqzlZrPMBpW7hutX/VGFGVMxMlMSCnYHLw4mz+5
         ghsCLrTpMCeiLZoVomRlKDU2ieMNrLvoh/JbdmzOKqFsOLmtwOFVC76U4IpukVsGggcl
         em/TfowNQUSEs+rdaP7vL1TagBFQS0jUPpJa/AFeXEM8U6DfKRTe+FP3VbqebZAp1OBv
         UtFLCaaLD3Z9IlYXa6HBmgD/ziVxRVfa4UYhve/SZzyHbF07B7q7kXHGxJI2B76PwbXN
         vpWw==
X-Gm-Message-State: AOJu0YwLGfhSuljOeVRdinp3Pyaj4EVdLfb4RofYdozGw2cGLsIcaSby
	s8XykLOGMwK0lKPDogsDHIxglsmrsCEDyLPlp8oFBWXeHT5iEg4GoWlgNIr1czZ7BopD3Zn+UG1
	1aex21q51ZxAcBXC6IEgXaT4OV0wHu8YjgA==
X-Gm-Gg: AfdE7cn22Hgm3C9sDGv1mmCw8MS8o06sqsQgqBpfyFg26JqHRtsGVLNTgp09s9szkxr
	MgwnfLtKC5lnRUeC6rJI+jQsKzsnHCPHQLouynZmWhpR7uOL35dUCJmI0EOPB0JGSMopllXiaUw
	H3RaD4OKvI5kghoE7+T4pno5ZATkV2AvQ9WiW5ag84DKL+pXmi7Fj96xuN/zWt7SQw8s9nRhPTs
	hlyv7QBNoJS9GPdtM9YDpbecGrgnidGG4AIUkHcv5a2yyOUlozZ3VCRgvkRJchUUm0Si5piPTzm
	6T0IXw8=
X-Received: by 2002:a05:690e:1382:b0:65e:1d95:29d5 with SMTP id
 956f58d0204a3-66312f6d069mr21718468d50.41.1782332540348; Wed, 24 Jun 2026
 13:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-15-ameryhung@gmail.com>
 <20260624000312.AD6581F000E9@smtp.kernel.org>
In-Reply-To: <20260624000312.AD6581F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 13:22:09 -0700
X-Gm-Features: AVVi8CeluNs5g7tmC-ra0iSyMfqPCKtbCKXij75pC2NX9hfHTma3PP7t1VOVK6o
Message-ID: <CAMB2axPJ+iQ4kr4RkQtGYbzUe8sfVaVc3vjXj6_Gv=1NNhEP4Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 14/15] selftests/bpf: Test attaching
 struct_ops to a cgroup
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Test state pollution in the `inherit` subtest bypasses the int=
ended `cgroup_bpf_inherit()` testing path because the child cgroup persists=
 from the previous `hierarchy` subtest.
> --
>
> commit 9dd80df6f86c72623dac7d2f203da4036e4e8827
> Author: Martin KaFai Lau <martin.lau@kernel.org>
> Subject: selftests/bpf: Test bpf_tcp_ops cgroup generic link
>
> This commit adds selftests for attaching bpf_tcp_ops struct_ops to cgroup=
s via
> the generic cgroup link infrastructure. The tests validate various behavi=
ors
> including execution order, query interfaces, updates, and inheritance.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops.c b/too=
ls/testing/selftests/bpf/prog_tests/bpf_tcp_ops.c
> > new file mode 100644
> > index 000000000000..4d087bdc4613
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops.c
>
> [ ... ]
>
> > +static void run_hierarchy_subtest(void)
> > +{
> > +     struct bpf_tcp_ops *skel =3D NULL;
> > +     struct netns_obj *ns =3D NULL;
> > +     int parent_fd, child_fd =3D -1;
> > +
> > +     parent_fd =3D test__join_cgroup(CGROUP_PATH);
> > +     if (!ASSERT_GE(parent_fd, 0, "join_parent_cgroup"))
> > +             return;
> > +
> > +     child_fd =3D create_and_get_cgroup(CGROUP_PATH "/child");
> > +     if (!ASSERT_GE(child_fd, 0, "create_child_cgroup"))
> > +             goto done;
> > +
> > +     if (!ASSERT_OK(join_cgroup(CGROUP_PATH "/child"), "join_child_cgr=
oup"))
> > +             goto done;
> > +
> > +     ns =3D netns_new(TEST_NETNS, true);
> > +     if (!ASSERT_OK_PTR(ns, "netns_new"))
> > +             goto done;
> > +
> > +     skel =3D bpf_tcp_ops__open_and_load();
> > +     if (!ASSERT_OK_PTR(skel, "open_and_load"))
> > +             goto done;
> > +
> > +     test_hierarchy(parent_fd, child_fd, skel);
> > +
> > +done:
> > +     bpf_tcp_ops__destroy(skel);
> > +     netns_free(ns);
> > +     if (child_fd >=3D 0)
> > +             close(child_fd);
> > +     close(parent_fd);
> > +}
>
> [Severity: Medium]
> Does this code leak the child cgroup and pollute the state for the inheri=
t
> subtest?
>
> Because the child cgroup is not explicitly removed here (e.g., via
> remove_cgroup()), the directory persists in the filesystem after the file
> descriptor is closed.
>
> When test_inherit() runs immediately afterward, its call to
> create_and_get_cgroup() will re-open this existing cgroup instead of crea=
ting a
> new one. This causes test_inherit() to silently bypass the intended
> cgroup_bpf_inherit() testing path, and instead exercise the
> cgroup_bpf_update_effective() path during the parent attachment.
>
> [ ... ]

Ack. I will fix the missing cleanup: join the original cgroup and
remove the child cgroup.

>
> > +static void test_inherit(int parent_fd, struct bpf_tcp_ops *skel)
> > +{
> > +     struct bpf_link *plink =3D NULL;
> > +     int child_fd =3D -1;
> > +
> > +     plink =3D bpf_map__attach_cgroup_opts(skel->maps.tcp_ops1, parent=
_fd, NULL);
> > +     if (!ASSERT_OK_PTR(plink, "attach_parent"))
> > +             goto done;
> > +
> > +     child_fd =3D create_and_get_cgroup(CGROUP_PATH "/child");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D14
