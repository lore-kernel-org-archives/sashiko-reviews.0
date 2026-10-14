Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF54E1C9B
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986572; cv=pass; b=Czcd/Uklrya0Prft6HbB2i9R2VI8AuFFu8vJIkeYH2AVvR5L05GA1pGi209SruBA/wkNFTwYjCsGHeeGFiqmFX6JqvhZALczDU4DAhpN1Xre34Y/SpyY43tNpMz9XUXlrnsCqRDOE088MK8b+2AP+89ZBGfhORwTjVXU9LtQ+gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986572; c=relaxed/simple;
	bh=YEOv0lkDuDfe1/lH4QgCR9CxwKBKYUyc20EQrB/D8SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUtPDXMIM5Kjxz6A7ZQucnVRvJ8z/gC/1Xihn8LAY/4ly+ZltFeri72Sw1VQCC7z5WHA8KsUs2dN+6sifYU9lxCgO/jpFrI/QWc94GrRCOi2lK3h9S2Jk4+pYz3XiR8Zf3MZbOBH1zT4eLKgFu/zngbUmB0CbU/rAikeW19TC8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=L7e1NRYe; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="L7e1NRYe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-873a4edb243so432179b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 07:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791986565; cv=none;
        d=google.com; s=arc-20260327;
        b=tAiN3W0y8qCDUSWFufuASVscAzzvxICwybtLjel8kd9hwL8OnDACYdz8h+O3GPl+7s
         LvUzZ0ZXHc8il/H0oTLL4Q0tVFStm6zAeGtYv9wnM2ReEuuM/OYzPNFA7kPxKlRqy78P
         Nge9unjz6Hq3uf9Pd9/8OBZhVNiJYlKgqV4UOFq23K1m9DqpRD8CuLOuCds2ttc7e45x
         5IoXE5n9j/VIXtO+BTK6NHe+XFKk9w7HgiNsWXHjx/CDit0HQWdxyjbBqh5T64YPprz8
         r2I4ap/YCCIzpdBwyitkLJ8r28GVt6v1JhPi1wOOzF2zJUmTG5c21Ho64Dv3Q/mKS4zX
         npkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQUVLUG7DltcFgXT3o9WfFA1jOm16iz6IC0qdjR5XQk=;
        fh=wGIfM4SDsvwXTYm+1UMI8PCP4gvc4mmOjGq8ffGSMew=;
        b=WWNWFwstIMN/SblXVKIMytFRvYzVhHatrQ1XN5fUd1j7Jfnh78Q8LSiNfKd7bvGDEW
         YiV10vZsTqAVx/jSOfHeqxgq1zvNZUB8ZEUOhSXQzuYiCjkm89f3tuB0kz1UzzU+yc0u
         vTZ7ocMkek3vWKZRQSA6VD/kBOTMlo8yJ/BN4KzOMTS9RRTZVbIWQXGazeLLsVWfUxYI
         CEgK60sNzQvm/N3qTqqMGhMngmlSocuPg3yMuyJhI8lGGN2yp0Ma3hNX6w2iGZwvpeAt
         r6ITlZ+6RK+EeOIHzSbNkuOddUD+iHfUwWK/WqMeeaghujZxbV4x0l1cQMahrSK7Uegq
         AB/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1791986565; x=1792591365; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQUVLUG7DltcFgXT3o9WfFA1jOm16iz6IC0qdjR5XQk=;
        b=L7e1NRYelrqxzMR6BgYz4yBbqGGOCpkm50/xx3UCZOVRc+6UMeZyK/dNsHHzIJBSyC
         0tXT6ifBwC+tH85WCWVtEkBiDSsRXDg1qDZvU21RT+TgLv6lvps8htAaXBGIbvk+n4hE
         E/h7hvRuiogfVM3nEXlH5r2/iK6Y34bt/pwuN/5VKakzYAjTTutnX4PJSDs/r+i+A+du
         AjUKEIQmIO+nKQktrwbJ7lsEtI+VXSY5KzIFkX4RDRDSSdt84r0QQYJpEplk24vUaUoV
         reZ5VrOsl//otVZoflj+OnwOrJoNbR+TSrgV7+0KLcr8sk5MLzZLN3RjaJuf3fKVAiNU
         fP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986565; x=1792591365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQUVLUG7DltcFgXT3o9WfFA1jOm16iz6IC0qdjR5XQk=;
        b=XL9k720NgNCGUyTFLmqEJnxTQLj4H6ULo9MBnQE1eR6h4WhFM8IVJdndRlNHlVF7jx
         4WQcacpXt/G4a9cM9YmUDqiCELzt/m025IDIYTLpresC4+RmvFVKveZuQp7CsDlzXk2R
         XqPPUtNM4whGNb0QKnh9rkWShBZFyUm+3Y6qREuIQU4XYuAA1BlB8F78xucSvtQM2aec
         HOWQvZfvhDeRsW9ucParLJ45rvauD55xq9OJj6iXkb2lsXDTIXZOK04EoeDRPtfsztw3
         GrMXYp1KOYDbsMmIA3YS1dHMT6GegtIKdBT2/0KFKK3hJVxv1rdJ9pLXVzL50dqh5wT/
         dOwg==
X-Gm-Message-State: AFq9FYJG+JauZ2PJuUK0BuGCxUBneNgU6xwYJo+CQYJtD6aDtJWpgUHb
	uRkePOfZkwtB3fjRoSE8w9rDGg0ljZ5suJLzCTw7dekXFFBrT2LsP3Q33Jr5WzOZAw3HbdCAkD0
	bonMtcOyYNMynLvPwtQrX+RP0RrNeLvuibfzMTOw1Yd+CsiOK+GxwwBvO
X-Gm-Gg: AYBFou3DlICq7r0FoNkwu8UuySbVNeaWD1oW6NkEPGOXMb/qkqcGx3FwSKJ/l6GhSRU
	gTBrpc1Cbuavg5Kfc1fOBWlPz+LXCj5e8COdHg9zFgArTvbSRGAUK5i5z84M50W2pn3QrFlFXEk
	dbwwF6rifPoZCIeOCioHKNEcg9SlqgHiLyWPDfWuvnCp1gsrq8E9YePGj3DwHz4SV1UnkZ5n4wu
	1rd5OZhFRSdnC+ulGNQusnbSUR15LtKDunECwVrC/csjj3nl408nGusyVCZoQFHku1WdTeyEC6k
	rqRJwWdsqKjcEKWalHeCLWDqMYGk+mZ9728C5IpbPRKxP3D06J0V6/3nXRtk3KOQ8J2QzD4gefz
	YT5JlTxx5PT4=
X-Received: by 2002:a05:6a00:808e:b0:89d:e6e2:b2a6 with SMTP id
 d2e1a72fcca58-89de6e2b696mr1267507b3a.45.1791986565407; Wed, 14 Oct 2026
 07:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179147329205.58079.5847298721173675285@gmail.com> <sashiko-outbox-165773@kernel.org>
In-Reply-To: <sashiko-outbox-165773@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 14 Oct 2026 10:02:32 -0400
X-Gm-Features: AclHuK8TuxrF8-DsjOzDAUY_v3JLgEdrFU4cDHorWjqtWqZ-YeQ0FatFCmw8g4g
Message-ID: <CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com>
Subject: Re: [PATCH net v2] calipso: update payload_len when removing the
 CALIPSO option
To: sashiko-reviews@lists.linux.dev
Cc: linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 11:32=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] ipv6: calipso_skbuff_delattr corrupts MAC header on bridged pack=
ets
> --
>
> commit 9797bee2d14350b4afedb726df3172b004b7badd
> Author: Joas Antonio dos Santos <joasantonio108@gmail.com>
>
> calipso: update payload_len when removing the CALIPSO option
>
> This commit updates calipso_skbuff_delattr() to adjust the IPv6 payload
> length after removing a CALIPSO option. The patch prevents forwarded pack=
ets
> from being dropped as truncated by subtracting the removed length, while
> leaving BIG TCP packets unchanged.
>
> > diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
> > index c6a34334e657e..5a42db4f87472 100644
> > --- a/net/ipv6/calipso.c
> > +++ b/net/ipv6/calipso.c
> > @@ -1428,6 +1428,10 @@ static int calipso_skbuff_delattr(struct sk_buff=
 *skb)
> >               skb_pull(skb, delta);
> >               memmove((char *)ip6_hdr + delta, ip6_hdr, size);
> >               skb_reset_network_header(skb);
>
> [Severity: High]
> When a bridged IPv6 packet with a CALIPSO option is forwarded, br_netfilt=
er
> feeds it to the NF_INET_FORWARD hook where SELinux may call
> calipso_skbuff_delattr() in net/ipv6/calipso.c. Does shifting the IPv6 he=
ader
> forward by delta bytes here without repositioning the MAC header create a=
 gap
> that corrupts the MAC header on bridged packets?

I haven't chased down the bridging code to confirm if the problem
identified by Sashiko is true, but I do think that in the bridging
case we don't want to change the label on the packet as we might do in
the routing case (depending on the runtime config).

This would need to be tested, but I believe we could simply add a
nf_bridge_info_exists() check to selinux_ip_forward() prior to calling
into selinux_netlbl_skbuff_setsid().  We would need to add dummy
nf_bridge_info_exists() when CONFIG_BRIDGE_NETFILTER=3Dn to
netfilter_bridge.h but I can't imagine the netdev folks being opposed
to such a change; I'm sure they will let us know either way.

> Because bridged packets bypass L3 routing and do not go through
> neigh_output(), the bridge's transmission function br_dev_queue_push_xmit=
()
> unconditionally calls skb_push(skb, ETH_HLEN). Since skb->data is shifted
> by delta bytes during the pull, this incorrectly frames the transmitted M=
AC
> header starting delta bytes into the original MAC header.
>
> Could this result in the transmission of gap bytes and the loss of the
> destination MAC address, causing severe packet corruption and drops on
> L2 forwarded packets?
>
> > +             ip6_hdr =3D ipv6_hdr(skb);
> > +             /* BIG TCP packets have payload_len =3D=3D 0 */
> > +             if (ip6_hdr->payload_len)
> > +                     be16_add_cpu(&ip6_hdr->payload_len, -delta);
> >       }
> >
> >       return 0;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179147329205.5807=
9.5847298721173675285@gmail.com?part=3D1

--=20
paul-moore.com
