Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532629;
	b=3EFRJclI5gLbJJ1X7PWp2RaYOfzHciAXy8CGImgCMy80RWAFrp+ZnBvKfsseI15bCpoS
	 J76uI8fs7I/X6gNWXcnKVUaIGa3ApRfZ5gUCekZfGW4TurmaHyQV9uBAVzVGQyTK6dODg
	 eoRGJJkIN0drLE9y4oW8FfONMHP6z7Ki+0O09+9xdsH0qFZMCOUfpGNvMcCNZqHJztRLV
	 fBSaUyNyKkY7RBBA0VD07RSH+Y2QPW2kskiNc2gJiqYd9bPxKLdujk+jF1AhWrpwLfJMW
	 Ri/7La3CdpEjIATeXTKCZ/1zbQJ7IgAlPUGy1zvXubpFVwvKqOwiv+7zmvRXemqHg8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VCY7Y2w2dk2GqpAZkyjY/eRbnj4QFPahj+iatU43WJ0=;
	b=htZtBRgWbJScWpikLQ4J0V2qz2dpa6uSROxE5CLIkXuFGx62KIsVbIjjxusV/0OaJ1wE
	 +orhce8iUWe1M4uKItXAJ+DZgEILdhNdEtTeUcU/Dl+RkpV2zA17w+BKQl/zkBbsu0yis
	 EMgT+/PrTK2RSAZeoCXFTDezsTN7Bahl6wyxMIt+YzT97zDrlEYfVDAQJDpAJNfh4x0yn
	 FKfTQelxenheYDoz/3XDesNIV4prvrfhvd0rgmjpABk7jw7xABoLhGbTxpH5IC/AE/jEc
	 6DS5q/Y15YdSjGVUqQfHivzZCAyHc8Swbi8S4BNuFqqV91xu3btYmAE9JZA/i3WfDrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=heoNqBlf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D64606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 15:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=heoNqBlf
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5198302d38so92924066b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 07:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532627; cv=none;
        d=google.com; s=arc-20260327;
        b=ONboZZSJIf6ZXG2FpICZ52VmPmFRh87stlK/7iWNwRN0eSKNmM7A8t8Qb2dOeQvaH2
         GL/IfH1NytVeyOb/nnl91XTtbinva64IN6U8FVkb6mYokK5VxXkaKsPg9cV+Iv1Ujdzf
         DEcG8i0UWOUQiczpV740CQnBQE8x8BbUshYpDs9nWscm0DO4hX25cry2qDp1xfF1YjME
         98lxSyKvvtJiZQ8R71SoGfsP5KYVTZ2cC5ldEhoGVDnP4xX3I1ebGS3tXPPQjnDd57x2
         FyZeiwZgiL3ipnx5VFtxuEMIwCcM4uCXrUqNl5PK1TpWfpe1Xy6mg3ofkGkYCmhjStIq
         Z75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCY7Y2w2dk2GqpAZkyjY/eRbnj4QFPahj+iatU43WJ0=;
        fh=q/HlIiqlVZnDWxvAhF0N29mH4t2uibTJEa3ykCezHMI=;
        b=OY0a1WoQm/noW7T709QBhRJURDQ10LdI2yEgO9QURBdm6bzhG3xylVNd3hk7CXR57Y
         WG9b/ZbcgWRAWCTWfZg/tMgio/IKgRyYtc6Evu38gpS8zRn8gerQX17mnmcl90XjUKgB
         l/kN/EkqMe83YfUoaKSJx1ZU0KlTsfFrjM2d4fHI97rVhZwbTpghBtHXNOV8Aml3UIok
         M0K11vASXsEzP1pi7FYbja4q+q1Py9RVjcmJq2BhOlZ6uRjVUkkeP1FNgD84a88YaeQa
         9IOSX8Un9q37d1N5wsI4spM1Xoqko3T7qy0ob1zMjd6QKuZNd0Nof3cRcoi9QYSevtxW
         nSSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1795532627; x=1796137427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCY7Y2w2dk2GqpAZkyjY/eRbnj4QFPahj+iatU43WJ0=;
        b=heoNqBlftlsZFBN7WgkWOV09v/KAskt2voRo++i1YcEmsHOj9aUqNxyVbESW06B4aW
         591NrIHh+2Fq9NFi8lKF5GJqp68J5hQ63/P/TFPFQBm1toR1ZaK+1Mne1gva9vY/Ewqu
         +y5lmO1Ss2zLyFfilDqV6PnO8FuPZWH7K+O+RFBHweZQNymP2NKOz3W/sx60QlINUHef
         +ZM+g7vhuV1vyzpTgoHnJlZ3gSzwRbtg/Sgs7r42L3gHxW7gk9XHA2QZcUJopSNMqsMi
         Qhn9nginuffqn7XwzVVFsGczdDAzG2BOStaqv5o2qZN2nS9uAfymM8a3gsdlUc4m307C
         CxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532627; x=1796137427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCY7Y2w2dk2GqpAZkyjY/eRbnj4QFPahj+iatU43WJ0=;
        b=GvrbNLXZCfoaF6UmZmR4qVnUc01H/OkB/h9gAQzi1HXl25ECeWwCId40QkvzCQTJ6g
         cXaXpjmWgMvmI4BgqR2S+Mxi9WMLpmp3CnJvblCKCXKLi9cDRygEpkmpEXtSxYT30R2x
         ybCOeOszcCtjOrIhFvT5EZKJN3oCznEjn2N6TOhXnxxDFJ6zz87vEgx3jBVQO+CDH/uA
         g/kYlpJ+mueAYPUKdMnbjFZywb6eW4GsP57XxOKOJ36WeH7r+RlSj0M7mlEGHxNBcmi9
         q6zqfcH+4l2j+24JlTJgjx7QVYbaa1SWIlUZv1vmQL5L4cM2BvHIzsNN3moRSqxr2Rua
         963g==
X-Gm-Message-State: APuU4Z+T7POxIZ4/4atL4axXCPYfaBiEhyZfQitzeXjKRqcvSJWHPCGa
	0oac2p0hvGRahR0qy/a83dGqVTdO5CJelrFeYLLWqSRuKGhCfJNmshz+3wgDH8NCOTrj5xGKWSP
	1UQxGeQYWUM264RtsnxNnX/3z+Wu7wm7XSE9zypJNDSsD4+Mml/ktkSU2tQ==
X-Gm-Gg: AZFdTZd9ZXhkO0l3BD74xRm3AhJgOZ1XUsb0dW4MSqHK4hlIsBQIe2MSyVrUhtSFyD0
	L4y073PpDX5xYevB0bt86K1fk28PzYBlDX0P/Z62kP0t28O+ufMevCuj/zIH6fojLPpgMCvk9OW
	MPRdfP2f66LhBjCB6KnfhpXaIq71aKqKODRuhHvV6ayHSS3C9wwaCUvc671R0u8J0lp+bkuF2RX
	ZfloCwjTTwWmMAFXMwZSNaKN/ucAC3GR3MnseLCa/PUSFDWRhdNhI905jq0tOUF6UE4waihKZpU
	KNK3ou+kcHvKKpHiSyznH65hBHwUROhasRpV02wjJc4rkPXs5fdbfQpnpVebeUoCkuoUR8lIuhe
	HCpBClqP3HO4nV9Gz/+nOyhe2T4C20Fe/+lRVgTvu4bq3GnjWMXyZqbxLY4KaceXU6g7sOVaLSG
	tR4GnJsktZw6XTW832vgXsQTpLKjfn24OAmiIvBazIqzxTxn4JCJtSutHAaSVaZetuhE4BQwdaf
	T8hUuiYRPxSeUwS4AVnLN1H
X-Received: by 2002:a17:906:383:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c513a5ea73dmr909885166b.17.1795532626771; Tue, 24 Nov 2026
 07:03:46 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123143719.938876-1-haris.iqbal@ionos.com>
 <20261123143719.938876-6-haris.iqbal@ionos.com> <sashiko-outbox-229434@kernel.org>
In-Reply-To: <sashiko-outbox-229434@kernel.org>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Tue, 24 Nov 2026 16:03:35 +0100
X-Gm-Features: Aa3M54rGFFJxdeKvVQk0baiADNCrfyuEVU653ZOhNJxA1vR4wwUIA2kDsE9_5Pc
Message-ID: <CAJpMwyip3EJTBT6JN90nYcD1-PjwjigW2OQg0xAsmHRMZba6WA@mail.gmail.com>
Subject: Re: [PATCH 5/9] RDMA/rtrs-clt: rename pathname parameter to sessname
 in rtrs_clt_open()
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org, =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>, 
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jinpu Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] RDMA/rtrs-clt: use-after-free in rtrs_clt_open() [1]
> --
>
> commit d270a6058ae45a4fbd952be02c065eb235215fda
> Author: Danil Kipnis <danil.kipnis1@ionos.com>
>
> RDMA/rtrs-clt: rename pathname parameter to sessname in rtrs_clt_open()
>
> This commit renames the pathname parameter of rtrs_clt_open() to sessname
> in the header declaration and implementation.
>
> > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniban=
d/ulp/rtrs/rtrs-clt.c
> > index 5ef912a472cda..c059d69c3e5a3 100644
> > --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
>
> [ ... ]
>
> > @@ -2848,7 +2848,7 @@ static void free_clt(struct rtrs_clt_sess *clt)
> >   * Return a valid pointer on success otherwise PTR_ERR.
> >   */
> >  struct rtrs_clt_sess *rtrs_clt_open(struct rtrs_clt_ops *ops,
> > -                              const char *pathname,
> > +                              const char *sessname,
> >                                const struct rtrs_addr *paths,
> >                                size_t paths_num, u16 port,
> >                                size_t pdu_sz, u8 reconnect_delay_sec,
> > @@ -2858,13 +2858,13 @@ struct rtrs_clt_sess *rtrs_clt_open(struct rtrs=
_clt_ops *ops,
> >       struct rtrs_clt_sess *clt;
> >       int err, i;
> >
> > -     if (strchr(pathname, '/') || strchr(pathname, '.')) {
> > -             pr_err("pathname cannot contain / and .\n");
> > +     if (strchr(sessname, '/') || strchr(sessname, '.')) {
> > +             pr_err("sessname cannot contain / and .\n");
> >               err =3D -EINVAL;
> >               goto out;
> >       }
> >
> > -     clt =3D alloc_clt(pathname, paths_num, port, pdu_sz, ops->priv,
> > +     clt =3D alloc_clt(sessname, paths_num, port, pdu_sz, ops->priv,
> >                       ops->link_ev,
> >                       reconnect_delay_sec,
> >                       max_reconnect_attempts);
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can a failure in
> rtrs_clt_create_path_files() later in rtrs_clt_open() cause a
> use-after-free and double free of clt_path [1]?
>
> When kobject_init_and_add() fails in rtrs_clt_create_path_files(), it
> calls kobject_put(&clt_path->kobj), which invokes rtrs_clt_path_release()
> and frees clt_path via free_path():
>
> drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c:rtrs_clt_create_path_files()=
 {
>     ...
>         err =3D kobject_init_and_add(&clt_path->kobj, &ktype_sess,
>                                    clt->kobj_paths,
>                                    "%s", str);
>         if (err) {
>                 pr_err("kobject_init_and_add: %pe\n", ERR_PTR(err));
>                 kobject_put(&clt_path->kobj);
>                 return err;
>         }
>     ...
> }
>
> rtrs_clt_open() then touches the freed clt_path in list_del_rcu(),
> rtrs_clt_close_conns(), and free_percpu() before calling free_path() a
> second time:
>
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:rtrs_clt_open() {
>     ...
>                 err =3D rtrs_clt_create_path_files(clt_path);
>                 if (err) {
>                         list_del_rcu(&clt_path->s.entry);
>                         rtrs_clt_close_conns(clt_path, true);
>                         free_percpu(clt_path->stats->pcpu_stats);
>                         free_path(clt_path);
>                         goto close_all_path;
>                 }
>     ...
> }

This is the same bug being discussed here.
https://lore.kernel.org/linux-rdma/AB*APAAaLFrQFfZxcNOqk4oI.3.1795529068345=
.Hmail.202321181@mail.sdu.edu.cn/

We will send a patch soon.


>
> [1] https://sashiko.dev/#/bug/linux-982ecccb-b1ca-401f-8293-d1973992f3f6
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123143719.93=
8876-1-haris.iqbal@ionos.com?part=3D5



--=20

Regards
-Haris
