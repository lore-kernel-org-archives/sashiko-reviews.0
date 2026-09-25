Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D43AEB40
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379141; cv=pass; b=qZCcRFcIH/W0S3FQolIiqFE6dlEK+bh19sZxsCOGrQaTk8WkTehleN3fKNQc37u/QjMZLwxq3L5ab7wWJFkQL+zZSMOK53PKcRQxbP8j4AoHsrk5HLXnQLOD2S2/8M8nhU1v44Tf6hrD21BGGD++TuvGlI06opapT3jvZtEGpak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379141; c=relaxed/simple;
	bh=j+18zH4z+m0k1FZ0dd1cO98bGHWJwxwzLIK0UXvDr7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuGuTjrAXF4IaAnnToXQeHOMsjtEuYD2SaWj0nS0DLm7+VOe7EtIMk4HRJf692THD0R2zFZZqt3KFB1JPLXM4PrGf4/Az1NJj3/KT4l3+0dIP9SUiSsoIsE1IHj6CpkkZXknarCrxqnDTfL9c8KGrQYN+f0NLWa+PKNE9rGyj4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMlgyAK0; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMlgyAK0"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so6570955ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 16:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790379139; cv=none;
        d=google.com; s=arc-20260327;
        b=r2A+q34EsoyUaMmDynjz/6+IW7/MWdK7G629uVvYziHvO0chXrRlV6rukCjFp2mQhe
         I/cpa5Tvyh/IHaK4A+c6/0T/0X0PxjQujOmWqfz1mJLI49h17yIUXtZX3aaMY7jyJZLL
         wVjD1Fu4sk1AlhdC2Px8zQih/lj1epovi8LXlcPeeRQwO8pCYSFFsHboCrkuJCu6VUJ5
         QY25jFFpWnUoO38GjBPU9+qYUbnALGE2qmuupoDeFi4H0/gglLYtGpeyGFuWU2u3Gktm
         lcX1lzMA3Ap8lziwXP1+E0C1L8KCWR6+5T/OsHLZj5zKZtS/1Zgnh0G3vMNqcxuov5eX
         e19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uojy6J6IqOesK9tCRrbsVJpUEHxbUlzpNFdYyzAnwaQ=;
        fh=iVbzucXGpMk9epqvqFl+31RxW2EZ/9tfB0+u4C1h4t4=;
        b=fDHS+fmOqeYg99nVsr7oTHNWStHSKa5TwIM0jWK6hgZWEBJxHN1ezUCZ9rAktz4hm/
         mrgNoqgprJaFlvDlGi+KltDbobDdhupgM7Y1q/qZaWi28pVqNNF2RqZ8JJC70CvjR8ok
         XrTai7wVrEcwG6HXuou0UizDfI3RWpX2PQDfswkiTkmAM0Kjdr5QPfogpVKlktCf4r5o
         3JEjdSuCoYQCVKXqqgR41belc9bIGS5z9a/1bJFY+5DR2tOtjfVzxJzGml6ZYCgq1+Dc
         eP522dwDNwDSPXj58+23HIYYYX3GMa5SkpK1jXZnRb5wZiqwtskUGN4woras5KebUyvo
         H6lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790379139; x=1790983939; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uojy6J6IqOesK9tCRrbsVJpUEHxbUlzpNFdYyzAnwaQ=;
        b=SMlgyAK0yj1Cc9VwimyeZSCDPoNQj2+8YNjK7r6chMvWMuOIpClYEfIv4NrxuZQB/t
         CICMyK7gXQzMnSUBprkiljV88ADZYnnJPqCvs6BHh8dMc+xCpPQAEZP2wXf1g6YRrpt+
         p2tS0qzkcrGa0xbBfYkajdqzhlAiG0kDc+zF91lUWhwhhJm1DDFuz5o7XG+bWgBn1Vwz
         j9dei6pBgBQWtYrRuBhZP+DyAoiBl5h7DnAci78iXbKa/+qFIv1kRpbUFbxWWq4pJ4rR
         w2ITIstP8McKlGib2ZL4DtwG9k3486pl6FetVMSjfOq8Av6mF92enbctj93w8VE0CGEv
         MAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790379139; x=1790983939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uojy6J6IqOesK9tCRrbsVJpUEHxbUlzpNFdYyzAnwaQ=;
        b=u80hVPfy0V2puvlf0u9wOvMsRfceDdC6TTekJUeTgo5AziKDMFQPUIs0tnqRpSvNdC
         8HewZFbDt+lR5oFHHGmNQrYr+Jal91QDy27dnFEiF4Si/plNq3XAxu2n0phCk084qJNX
         JB87exbpjBpAJAfCF2y0loKWSSwBf8wt6o25PzSjTRJPTXbQK2auT8M0ieedT2LKwjpM
         lEmOcbGAq6QM45DRuDMkjwCLDzrzqKTz7EDvkR+WZDc4VhpXfkChvk2nBI+D9/l1QQPy
         fRoGpQ86L/we4HQga+g0dmyOQh7Bv1hNbXsoEyrlcYp7VHW2Sr9RCV9L2VTV+Hvk+YNt
         EgHQ==
X-Gm-Message-State: AFuF++m5wzBy4jqbpNl9ihcmp1Ji7Pr/LD9cRNL05R3KFrDOqqHteMRu
	4q9w/uaDOO7QF5Jv07iQYYmq4xqvNe9sQ4y+xgICyzrkmuYbRB8hdlFXK56eaCNYCF4numZRQAk
	sV3HiQ/KoC3wE3h9AL3mrshGgr1SRSPIwag==
X-Gm-Gg: AYBFou08aQvoGcRJ42w72s+AiiL0DHxQ5JXAuH1izS4qnOz5lRulOQhvGMJQ8FXEZgl
	4EXlpov6Za50bL4F0wICk6G0hq2BhNH5D8/ypeLjVwuuO7lfL7EqlGo4DFT9g5fpJhFojIgiImn
	grJhZQrx4ot0HXG9sPvm/eqCCefMf7ImS/SlbfNCQp5S5YLKVYshmjGyxDnOqWk+1/YYW6eahDQ
	JqS3OjHMLyOZUV14VcRn39GN1kc4h4K8dTBFqvmkBvw6ZjTh9HDkSjy3tE9aNseFky92lpWRjzN
	bofs0h6taVc2RsN5KsWeA029PFxNKxy1p71gVjKY4qVYRlrbBql47FhC266g4qL/P0KYFRff0d2
	oksEgWSRiqBB+95AX0EZG3pkbgVV3V+ePxEUf
X-Received: by 2002:a17:903:37cd:b0:2dd:c053:c208 with SMTP id
 d9443c01a7336-2df7dc1ee10mr53227255ad.36.1790379139383; Fri, 25 Sep 2026
 16:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925224631.1490488-1-andrii@kernel.org> <20260925224631.1490488-2-andrii@kernel.org>
 <20260925225809.B4AE01F000FF@smtp.kernel.org>
In-Reply-To: <20260925225809.B4AE01F000FF@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 25 Sep 2026 16:32:06 -0700
X-Gm-Features: AclHuK892OGHXlxagHR-gVN-qbZR0IEC17qQX162odU9MC5MDHyosbHdN2Jnj-0
Message-ID: <CAEf4Bzb1vDcu1NWs79uOwrmXUz-J4XetWQiUYUAaTuAu=su99A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Add linked_externs test for
 externs in allocated sections
To: sashiko-reviews@lists.linux.dev
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] bpf: TOCTOU and missing error check for mkstemp in test_relink=
()
> - [Medium] bpf: Missing NULL check for bpf_object__btf() in test_relink()
> --
>
> commit 2e7da3dcbd552604f0f6c052dc8cda7a3628ffb8
> Author: Andrii Nakryiko <andrii@kernel.org>
>
> selftests/bpf: Add linked_externs test for externs in allocated sections
>
> This commit adds two objects that define an arena global each and declare=
 the
> other one's as extern, linking them into a single skeleton. It also intro=
duces
> a test to drive the libbpf linker directly to verify the relinking proces=
s.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/linked_externs.c b/=
tools/testing/selftests/bpf/prog_tests/linked_externs.c
> > new file mode 100644
> > index 0000000000000..29358c82dc356
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/linked_externs.c
> [ ... ]
> > +/* link in1 on its own first, then link the result with in2 */
> > +static void test_relink(const char *in1, const char *in2, const char *=
sec_name)
> > +{
> > +     char out1[] =3D "/tmp/linked_externs.XXXXXX", out2[] =3D "/tmp/li=
nked_externs.XXXXXX";
> > +     const struct btf_var_secinfo *vi;
> > +     struct bpf_object *obj =3D NULL;
> > +     const struct btf_type *t;
> > +     struct btf *btf;
> > +     int i, id, n;
> > +
> > +     close(mkstemp(out1));
> > +     close(mkstemp(out2));
>
> [Severity: Medium]
> Could this result in a Time-Of-Check to Time-Of-Use (TOCTOU) race conditi=
on
> and silently ignore failures?
>
> mkstemp() can fail, returning -1 and leaving the template unchanged. Beca=
use
> the return value is discarded, could concurrent test runs end up using th=
e
> identical fallback filename "/tmp/linked_externs.XXXXXX" and corrupt each
> other's output?
>
> Additionally, even on success, does immediately closing the temporary fil=
e and
> reopening it by name in a world-writable directory (/tmp) introduce a cla=
ssic
> TOCTOU race condition?

classic no less, but I think we can survive that possibility just fine.

>
> > +
> > +     if (!ASSERT_OK(link_objs(out1, in1, NULL), "link_stage1") ||
> > +         !ASSERT_OK(link_objs(out2, out1, in2), "link_stage2"))
> > +             goto cleanup;
> > +
> > +     obj =3D bpf_object__open_file(out2, NULL);
> > +     if (!ASSERT_OK_PTR(obj, "obj_open"))
> > +             goto cleanup;
> > +
> > +     btf =3D bpf_object__btf(obj);
> > +     id =3D btf__find_by_name_kind(btf, sec_name, BTF_KIND_DATASEC);
>
> [Severity: Medium]
> Does this code dereference a potentially NULL pointer?
>
> bpf_object__btf(obj) can return NULL if the loaded BPF object lacks BTF

except it won't lack BTF, so yes it's fine

> information. The returned btf pointer is then passed to
> btf__find_by_name_kind(), which dereferences it internally (btf->start_id=
).
>
> Could this lead to a segmentation fault on malformed objects instead of a
> graceful test failure (e.g., via ASSERT_OK_PTR())?
>
> > +     if (!ASSERT_GT(id, 0, "find_datasec"))
> > +             goto cleanup;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925224631.14=
90488-1-andrii@kernel.org?part=3D2
