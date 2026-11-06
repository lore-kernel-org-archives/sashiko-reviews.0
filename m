Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955095;
	b=GMyUV+gOkssy7d0Dr5E++pk7WeQ4kwjWsfTNtM3vJdO8TFmSQ3/2ujJDp8DZY0Kj39Q6
	 1Pm8ls0pHTgJwq5ncI6qPZ0UKx65XvVOMO3PuUMUB1yBKdYtJM3MSLdTimeH4hksMbHRk
	 gDQUQIKW1Xr04lhTOczrEJU8m3A4Uq7zbezwG+RBMp1H3ya2yeVS/v5mgQvCg60JqaWrn
	 89ty7aJBR3ybI5scFT68W6++0O8AtXdictfBzY4Dp83fdqE5qZFh0HtV5s9I0dzQJYITn
	 oejGa4rOG9h3QiJ70bOjC+POLm5zOiq6EtpsYkd+0ARjQZQU/nK1YmRW/4POh8QdETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955095;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NxKjmy5QN7CeV9WgkfECxfwOizM91A5Tir8dDXhRPyU=;
	b=e5l7AmnkoWovBOuN8VgJF2up/MR1DcB3HgbhcNsYy6B0RCloZskztqK5iLZI8PSOnCCG
	 pU7/lfqnAk6OuBOUkkP8E6u/UnDh++oWaQNtvcyVTvHWXfd7FYpTKcl8MvmxmJlpMVsBR
	 zofknRfdkAPE0F3mhBCrsi8K6WvL95v8bmRKhdO8B2EYBOKGnfNm/xJTFDMtgpl2yjMob
	 AmqXCbYHHBHVvoVZ+Wu8m44lxxHcg2NqtiKqn3P8i7Nt37A007wawBo+DbUrq/2UJIDQw
	 Rszxhxnsg/JXGfDMijgX9cipG8BpZJ5MhpYVgrPxQKFz+atQso/PvuwYuHhPhTUnLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNNd2HIr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED9B606A326
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNNd2HIr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65DA1F008A1
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955094;
	bh=NxKjmy5QN7CeV9WgkfECxfwOizM91A5Tir8dDXhRPyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gNNd2HIrRRdT92bXAazI7N4/BqlR9Gv20O0zyK/eGoQlAkq/if1fcCLL3xMGbFP+G
	 GoTIo8pO9KSWF8XWCo6bwwhpazFEUDNShw4n/1yx6CN5/zTSZwE5otbYWYxH71Do1N
	 ItE5Ji2L1vhYTo2QTqT/d8MluMPBhGEvQg1I7tHjIaUCi/S3plqeXKbMHCsj0Znhyx
	 XRGlIh6/tOd258eqHLIS3Bmem1iws/5n5A2ZzoPsCpaMxBq73odo9ycpdGKu9CoKxW
	 62NcSh6hiHZ6RHizc2QA8BiNfo+fs0Y+y3kHL67WT1Y/oBsMCImpisKijglAlQ86FW
	 KMpAeIb5GMtyA==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53c156ba662so201907b6e.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 00:51:34 -0800 (PST)
X-Gm-Message-State: APuU4Z96FtuEJ7uJtahKbHwZgw9Ui/aIGruvRsGhGYqcjPPzn064ajUW
	7JrRm5Wsg3nlVrGUOZqJakZ0/RalvJLkttR7ywh9FBpv7+ZNusV5fDwwpyhJvMwJkSC0ZYW/vr9
	i9QpjvT/+4AZM8hKMm7f8tf0gfFuHbdw=
X-Received: by 2002:a05:6808:178d:b0:4d6:90f3:74a4 with SMTP id
 5614622812f47-567e116a68bmr1279668b6e.47.1793955091771; Fri, 06 Nov 2026
 00:51:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105115715.1466924-1-edumazet@kernel.org> <20261105115715.1466924-8-edumazet@kernel.org>
 <sashiko-outbox-201044@kernel.org>
In-Reply-To: <sashiko-outbox-201044@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 6 Nov 2026 09:51:20 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir2RmHmYoFNOLCw8LJpWdd2d9o-VXNqg4fF6YYc+YD6cA@mail.gmail.com>
X-Gm-Features: AclHuK9XApUbflAHprGKceK5i5r_ngI2pvMUL-7_WRp2a9gpBQA2cue61obcqS0
Message-ID: <CAL4Wiir2RmHmYoFNOLCw8LJpWdd2d9o-VXNqg4fF6YYc+YD6cA@mail.gmail.com>
Subject: Re: [PATCH net v3 7/8] selftests: net: tun: test more outer header
 mismatches of UDP tunnel GSO
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, 
	Eugenio Perez <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 6 nov. 2026 =C3=A0 09:16, <sashiko-bot@kernel.org> a =C3=A9crit :
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] selftests: net: tun: off-by-ETH_HLEN lengths in
>   build_udptnl6_frame()
> --
>
> commit 5c13d992f1a4a8ebd5983197ac9a5424f5b3dd20
> Author: Eric Dumazet <edumazet@kernel.org>
>
> selftests: net: tun: test more outer header mismatches of UDP tunnel GSO
>
> This commit adds tap selftests in tools/testing/selftests/net/tun.c to te=
st
> outer header validation for UDP tunnel GSO frames, including IPv6 outer
> headers, mismatched address families, VLAN-tagged frames, and non-UDP out=
er
> L4 protocols.
>
> > diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftest=
s/net/tun.c
> > index cfeca53863ce2..a135d3aa10d18 100644
> > --- a/tools/testing/selftests/net/tun.c
> > +++ b/tools/testing/selftests/net/tun.c
> > @@ -869,6 +869,103 @@ TEST_F(tun_vnet_udptnl_proto, outer_proto_link_ty=
pe)
> >       ASSERT_EQ(ret, len);
> >  }
> >
> > +/* Build a 4in6 Geneve GSO frame whose outer ethertype is @l3proto. */
> > +static int build_udptnl6_frame(uint8_t *buf, uint16_t l3proto,
> > +                            int payload_len)
> > +{
> > +     int hlen =3D UDP_TUNNEL_GENEVE_4IN6_HDRLEN;
> > +     uint8_t *outer_udph, *cur =3D buf;
> > +     int pktlen;
> > +
> > +     memset(buf, 0, TUN_VNET_TNL_SIZE + hlen + payload_len);
> > +
> > +     cur +=3D build_virtio_net_hdr_v1_hash_tunnel(cur, true, hlen, 140=
0,
> > +                                                AF_INET6, AF_INET);
> > +     cur +=3D build_eth(cur, l3proto, param_hwaddr_outer_dst,
> > +                      param_hwaddr_outer_src);
> > +
> > +     pktlen =3D UDP_TUNNEL_GENEVE_4IN6_HDRLEN - ETH_HLEN -
> > +              sizeof(struct ipv6hdr) + payload_len;
>
> [Severity: Medium]
> Are hlen and pktlen in build_udptnl6_frame() off by ETH_HLEN (14 bytes)?
>

Right, both miss the outer Ethernet header. The tests passed because
the kernel checks under test do not look at these lengths. The
selftests are not part of v4, I will fix this when sending them
separately.


> UDP_TUNNEL_GENEVE_4IN6_HDRLEN only counts one ETH_HLEN for the inner
> Ethernet header encapsulated inside Geneve:
>
> #define UDP_TUNNEL_GENEVE_4IN6_HDRLEN                               \
>         (ETH_HLEN + sizeof(struct iphdr) + sizeof(struct ipv6hdr) + \
>          GENEVE_HLEN + 2 * sizeof(struct udphdr))
>
> For comparison, the 4in4 counterpart in build_udptnl_frame() adds ETH_HLE=
N
> to hlen for the outer Ethernet header and does not subtract ETH_HLEN when
> computing pktlen:
>
>         int hlen =3D ETH_HLEN + vlan_len + UDP_TUNNEL_GENEVE_4IN4_HDRLEN;
>         ...
>         pktlen =3D UDP_TUNNEL_GENEVE_4IN4_HDRLEN - sizeof(struct iphdr) +
>                  payload_len;
>
> Because build_udptnl6_frame() emits both an outer Ethernet header and an
> inner Ethernet header, leaving ETH_HLEN out of hlen and subtracting ETH_H=
LEN
> from pktlen causes memset() to zero 14 bytes fewer than the returned fram=
e
> length (cur - buf), sets the virtio header hdr_len to 98 instead of 112
> (which is smaller than csum_start at 104), and leaves the outer IPv6
> payload_len, outer UDP length, and outer UDP checksum coverage 14 bytes t=
oo
> short when outer_proto_ok_ipv6 and outer_proto_bad_family write the frame=
 to
> the tap device.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105115715.14=
66924-1-edumazet@kernel.org?part=3D7
