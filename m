Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5812EEE92
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 22:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549235; cv=pass; b=I9vpjfLcds4vtD77zB3MVONOgGneK4se3YqV/27L+86Ey137zDWb5XctMKtQMzxVNfQkZj2bvVcZEeKPmEfbn/dWG2Z3+TflbD2+Xc/p1bY/fJQ7V/VQd2kYRLwaXYlmmjFT8ci76Dp+KUQX87n+9TB06EmJMDa1Ct+0kk2wCq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549235; c=relaxed/simple;
	bh=13e/yABJLuq5e3xhn1IcZZe5oBwPbnwbTkVGh4XSUbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By6dzoQCBhWSnmP+N503YcX9YZKqZ9+E5tYrYnpMp4bRsAcjtS+yYUSmznhBCrUgnvwYq5abLm+8ybLPt5gfPtdINNBhCwPGWqZuJucvc5LrykaFjjfF5WQE3SIMEq/mwtgEbu3eIS+5nbQzVVlTkSVH1ZOa/62qG/M5hZ9f63o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+F574hT; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+F574hT"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so3587832a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 15:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790549232; cv=none;
        d=google.com; s=arc-20260327;
        b=hYMgyDATUPnzbtLGSEGIlImeDd/5Mc1Hk358HxbXcuEUe9uxmhtNfM26tN4FLVSzdH
         xt1Nle7rHNXYe6mWH3pWetofuNnRqAYpsziinfXXK3Bg5GYp3vkaPaYyRFTCWZ9Y31gF
         rhd8PmP4CwnMvVsiPUckF6BRA2ep55tVg7lhYP/LcoZ3f1GsgD9yG0W9YynE5SVh/S8H
         XxIyF465GS0yvKd4l05i7EHiBY30TTPuHG9kl6b0TC3yzYvp1oJvcq0wDXCo6Ev5QfyD
         UEj7exW4hy30cmGKuWq2rf7wWKDw7+rXjruwtAIrxr8qaNtP17H3gtAj6xAhZohdSqZL
         lS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIJ+NAQNwQQ8hmxlSZFAjXknCZBUfMJn51nkt5PbrzA=;
        fh=0PeWkqJs9HC2jcyp/C+B26D3S5MkrflzYAjA+rPYVtg=;
        b=mhpXdX5yoR1u6ezDahxBrVzlC5xbM0ip3ezT25vwwa4GCW5T3nOWn+rtCUOewzWADa
         2XAYgBYPzbYKQX8qXuLgwA6JVcjaUyauhVv11BVpZhuhwu0UDnTizQ4vJ6g6SCx0bV3R
         sqt8rMsvY3eXG3VUx4VCbuaDKjxIiR+LEWWPge5K2JvQOMfe+5XWLX0eKsCjnXhqHRc9
         0qeR2sGbC1dolG5vtdh8JCImZibhczAxdf7jJ6xoGzk9XN3TPD9pEW0r04/uLagv3WJv
         t7t/ihrgdtFhjrMz6lBzbeo46ZWTiFpzl2XoPlb9BALQXe+DpbFlojfMJBFEA/iSbTxU
         W9Jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790549232; x=1791154032; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QIJ+NAQNwQQ8hmxlSZFAjXknCZBUfMJn51nkt5PbrzA=;
        b=V+F574hT86xVM96XRA3Oq7ib4g0c2B7w+Phuju0jrRz/1eBwZEJ0l0CmGJ+QIOGhkd
         AiNh9gz1nJybxQCMA8MwDX0Lv7F5ChCdvdwgb8X92Fv0y+5zxiKUjc6wREAnixJztBcy
         JBd6WPcuJMi84oYnTZWJbnR6zZMtA2q+dcpmp98ed1Bc8/7yBtGnibpaWsETRyXMN9i0
         jbOcR7aeUmg8v85kUu2chpApawycVlK1lQ7oaGyQPzQy17VspMhE119hcAhcgKXXgDlT
         STfQPp5aRE7IAteINEjLtar3ZFvRnrdw/BesKL74kfMqrQ1JW1w/L5XtTlmMjTddtsy0
         cbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549232; x=1791154032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIJ+NAQNwQQ8hmxlSZFAjXknCZBUfMJn51nkt5PbrzA=;
        b=KIF1hO4oUnqZfWmwZjneu1+/lvLepytXIIdnUhFJdoEshrNdjQU8/F/S1T2tzFiTsH
         6uD37GBWBqTxskakPfgisD0+lUlj5Q66ZcpPinjcWs1TqnQ4wr1t9CD8o0jtGKdKqWo1
         q3QS21HIzhrSAnAdFnHBZvEFp6vH703Z6H42rw+iXsr0MkJhAqg1bUUrLbGFYmkBDH4v
         epqdyAwxSbpw9d6nP3noLt7JH6OWX4p0ZlHY9YgDs5QxNGOag/Gzd2223BevyNurcobm
         OwIb33y3n6ERERx1FEwMT2G5ZpZgo6SFf/5/AB8yMFwLV8/6BK6P8TsvSdpprx9OEOYU
         CaDw==
X-Forwarded-Encrypted: i=1; AKwUvBz71aMB4PbMZTvnoITePX0wjl5Csq3KU+AZmPciJVQYGYGDcKFvsegTczygzz2zFT5vdLRZR2fKdsW6Mv6ivfs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJoQyOZIm0ugdkGkcF06opCQm1ZXAs8Ym7SS87So1mTiVxDS7fG
	AdB0o+roPIR7n5+RC0q7LQnUl57QddgWSZdjyfRLLebZnzMA0ceHz/vSt0p1F6Ohcszs5JVX0bB
	wKa4HYYCBMHiCDsLgTwjTwubCZ5dJzoE=
X-Gm-Gg: AYBFou0NnAy94+cUYw4/1bMsuSGYc1UX5G8FeNEQhcXum1OSf8RpcA8ctubQWYhoe+t
	jR3Tv7sV8L++aLSSFJxbUHGduPTZ1J74qxkt70BJ4qtFaRuyQukHaBcsS4KfT3C6IaVL3eKhRT+
	I/+Hz8GWRTgKQcjDJjXBrmUQc91Wl6kkY1S+NJGJDOMbLRWHxQjd0wDMlovsW3+y5fqeJn2yCoQ
	5GBApsd+wjmpbl6QMGPYI2/rNkXS+ftaDfRYF0wrv0ybjjSq0vWkM3yYGMcd2cSE+ALTJSutgEW
	8nqCy+M8r+929w652VnikC4scpiiv8HzP/g/kQlV2dsG2mR6mZvF/wuJIgJGasepahlMq0vH7Fa
	DBpvGWfXvxg==
X-Received: by 2002:a05:6402:23d9:b0:6ac:8dce:5a8a with SMTP id
 4fb4d7f45d1cf-6ac8dce626dmr16296a12.9.1790549231274; Sun, 27 Sep 2026
 15:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
 <20260901010347.2614656-18-alistair.francis@wdc.com> <20260901012040.554EE1F000E9@smtp.kernel.org>
 <20260909013616.13993627@jic23-huawei>
In-Reply-To: <20260909013616.13993627@jic23-huawei>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Sep 2026 08:46:45 +1000
X-Gm-Features: AclHuK80qnvQONQBTNAnvCROC7Xx41gEGXL0iR9jU1dQigho_4UbMx7DCECDSXU
Message-ID: <CAKmqyKN3ik5nHvRVEdAb96+CjXO8x53bFNsKMdOUWCWw-4Z2kA@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] lib: rspdm: Support SPDM get_digests
To: Jonathan Cameron <jic23@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	linux-pci@vger.kernel.org, ojeda@kernel.org, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:36=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 01 Sep 2026 01:20:39 +0000
> sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] Buffer under-allocation for SPDM 1.3+ GET_DIGESTS responses le=
ading to transport failure, transcript truncation, and EIO crashes.
> > - [Medium] The GET_DIGESTS implementation validates the payload length =
but completely discards the returned certificate digests.
> > - [Low] An undersized/truncated GET_DIGESTS response incorrectly logs a=
n 'Overflow' error.
> > --
> >
> > commit 7b16689f564246befd0f0c43fa0d4515876746e6
> > Author: Alistair Francis <alistair@alistair23.me>
> >
> > lib: rspdm: Support SPDM get_digests
> >
> > This commit adds support for the GET_DIGESTS SPDM command.
> >
> > > diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
> > > index b78086c753702..131c22319b262 100644
> > > --- a/lib/rspdm/state.rs
> > > +++ b/lib/rspdm/state.rs
> > [ ... ]
> > > @@ -612,4 +630,64 @@ pub(crate) fn negotiate_algs(&mut self) -> Resul=
t<(), Error> {
> > >
> > >          Ok(())
> > >      }
> > > +
> > > +    pub(crate) fn get_digests(&mut self) -> Result<(), Error> {
> > > +        let mut request =3D GetDigestsReq::default();
> > > +        request.version =3D self.version;
> > > +
> > > +        let req_sz =3D core::mem::size_of::<GetDigestsReq>();
> > > +        let rsp_sz =3D core::mem::size_of::<GetDigestsRsp>() + SPDM_=
SLOTS * self.hash_len;
> >
> > [Severity: High]
> > Does this calculation fail to account for SPDM 1.3+ fields like KeyPair=
ID,
> > CertificateInfo, and KeyUsageMask?
> >
> > For SPDM 1.3+ compliant responders, up to 32 bytes of additional fields
> > can be returned. Because param2 is a bitmask of provisioned slots rathe=
r
> > than a count, any device using slots >=3D 4 will produce a response siz=
e far
> > larger than the allocated buffer, which could trigger an EIO crash.
> >
> > Even for lower slots, this calculation omits the 1.3 fields from the
> > transcript, which could cause a permanent signature verification failur=
e
> > in challenge authentication due to transcript desynchronization.
>
> Nope. Feature turned off by requester not asking for it (yet!)
>
> >
> > > +
> > > +        // SAFETY: `request` is repr(C) and packed, so we can conver=
t it to a slice
> > > +        let request_buf =3D unsafe { from_raw_parts_mut(&mut request=
 as *mut _ as *mut u8, req_sz) };
> > > +
> > > +        let mut response_vec: KVec<u8> =3D KVec::from_elem(0u8, rsp_=
sz, GFP_KERNEL)?;
> > > +
> > > +        let len =3D self.spdm_exchange(request_buf, response_vec.as_=
mut_slice())? as usize;
> > > +
> > > +        // The transport must report a length within the buffer we p=
rovided.
> > > +        if len > response_vec.len() {
> > > +            pr_err!("Overflowed digests response\n");
> > > +            return Err(EIO);
> > > +        }
> > > +        response_vec.truncate(len);
> > > +
> > > +        let response: &GetDigestsRsp =3D Untrusted::new(response_vec=
.as_slice()).validate()?;
> >
> > [Severity: Medium]
> > Does this completely discard the returned certificate digests?
> >
> > The SPDM specification mandates that requesters compare the hash of the
> > certificate chain with the digest returned in get_digests. There doesn'=
t
> > seem to be any storage for these digests in SpdmState, meaning this
> > cryptographic binding between the get_digests response and the certific=
ate
> > chain downloaded in get_certificate might never be verified.
>
> This one is curious. I can't find a reference to the spec requiring that.
> Digests are a short cut, I think you can always ignore them and just use =
the certs
> themselves.  I couldn't find any text requiring the certs if we ignore th=
e digests
> but maybe it is hiding in there somewhere.

It's not in the spec, it's just a hallucination

Alistair
