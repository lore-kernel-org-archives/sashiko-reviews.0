Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4098F2931D1
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116484; cv=pass; b=pzaVDy4HHDCaiT0QO/NQkRAn5zJhbNZg8bibBiw7IRE/2NfYHxeujzB6pm0qg1oHNWN+xoKQyyMZLC/+/DFv0y7SQwyL05dKRJ7C1zcmlxv1HjCaK9vtR7Jd4zqWii7jZUY3CH70l4qT/87MmTV44UzB461FKvyDkHCZ8zZj5Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116484; c=relaxed/simple;
	bh=c1JekfdBO66GzW1rX/7zumfUDS7si1cbVflnG96ZLWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdjymDtgLgeO/03e/WcKBeWUSKpOVBRPFy3PvEoZvE7LH3ts2SH0Cdm3AkXf1P0E7BAZ2l6jvmOqkFnE/NxyC6kh4y7VJi5zSoxISL1qb5d/57Eb5d4eyXfqdGlU0guC/Jluee+rMQCMGmGnJeysQweslKu/rpeShAPtoEdjct4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YKJnVeyU; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YKJnVeyU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89f0a21880aso390070b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 19:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792116482; cv=none;
        d=google.com; s=arc-20260327;
        b=J7JAI1lNfmXdV5wpt+k5M3Zxin/eweGscgpwYcJk6EjCo/wuQ90Cu/rRaiqklEApjt
         Zg9dUkfseMZZ1cRT/PzSY+3hMcJWGvkajJXy+lXXTuaFfP7bvHPpV8vZDPROlhY8tGVO
         K5SJfSWltFz0XyFroOUSK3cB6QS0WOnQomyKXthPO/k8g9NdAWp6RQJ2JSQI16VCPUVD
         K+EY8QrJ7PJ79IAUAJeBcUtHR6UresfhePiZ1iseahMLWa01joR3hFR8E/0H35A+Vr39
         gXq3NakDFJ3V8II2ChDeMai9P8ckliHliI8EYq4GqJRcNJw/q5M3m7+OTvbRoWzIuvdn
         mz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfCTw59gEzccPxPGXarkXIf1k8IEGa1ctcGkrwNA/P8=;
        fh=p7frxmaZeIzdVkfFpG5dJ7rttfTulSPFNZIVfpU3Seg=;
        b=FNxaxMRHio8yJ7JSqlyCXoD47raqneShxsiTRQT1homD4otrOUVpl0O0dsk6l+NzJR
         Sq35Sgo6y4dsLz1mhn8lBXPO0fM0LmRZc6Y3tGf/dBkROVcPtKCQEjxyoGEMedU2NKWb
         2dbxpm7NJp8QVgJ5mQxT0JPs5QiNi5n6RpqgkpAeEjib1aShKfyuZVAXGosxFR5KQdf4
         FMAEyWOiuvO8tf8ki6ccblPYUBWlYaKr+yrYJg+nOYA0exAP0sUoIU8yoWDRrO2rLr0Y
         Sz4leaUKqtpLtOm8S1m3p7CLDVfG9Z5sBN6m8hNr0mwjy/EI0QfaM5AoYAF+wTHmeWlp
         xwMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792116482; x=1792721282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfCTw59gEzccPxPGXarkXIf1k8IEGa1ctcGkrwNA/P8=;
        b=YKJnVeyUgfJGMS6CDNo0lX84kcGghKmhzR+kif0Q/Z0ceGm/S5hjZzMCShW40XPy4s
         42xkronW0dtAhqqLkgfKHT9UqYMpa7vJBHt5UyaaI7t2jr1a0eGcztQF2dLTY7fOGakt
         92Yq+nZNq1Q7cCAIk5tDh0km/1pYxPznZueXL9Ra81tDikHBQXjTjFvRECIxMESzzGd7
         pa+2kWiOCsZhP5Z3s2jLFhe/uh8RO0gouL7KgYA6YDOk0eJFR/NhPxB8y6jFQm5hVXyj
         WZh7qPm/JR1MhARykhop+vMnl/qnRWyPxNMgd1Tf+YOtS3WRfKhJnps2UuHDQwF0DRLy
         +jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116482; x=1792721282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfCTw59gEzccPxPGXarkXIf1k8IEGa1ctcGkrwNA/P8=;
        b=vf1FZBguRuSKyyStF5jfaMtRxpmprnzHydv3VxLTHtN1boBcJVnvrI7lCAeIMZjThA
         rYIakrotz4zraPcc8KPO7hGVQbAzMrIfNVoAVMT80j+sBjDeewQ1UWpZ/P03X0vtmI7q
         Q/oEnhf+19lDVqCwZ0wytKnI/Qt0wGf2KyfFzrhNsVlU+2Oc0F+aWS4mgI7mxpoQjMO1
         3/cvdWMDQqnGE8JoXvlCmGmWKISEVV8lEyQw1M1vIWqPCSiOh6LCW9iYmN5oiJWH8CyH
         TUN2TtmzkKtOcmOBzXSbMNvD7/hZ+1eFXz++r7wFMZWeg5jfhF5hHNFmyViH8+HwPZAy
         RFng==
X-Forwarded-Encrypted: i=1; AKwUvBw1d2UDbwI+hQ/BVW16zO4p/7gITQ27FJteWZ6B/t6j8/csV+CDWkK+NHtkPf9rHKbOl4ezWwwtAcZWioAlUuU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJpIO9rWYbkgDj4m9d36Q8tQLuMm0GR/CI8mKWC9ejhtQ5bOqyQ
	B8NVGebSVBsO/CcrY5oCvQIkCQV/A/YHUTc+uXxR47LejiQboPGVEBieN8JMFnc4iRBU0GdgQ6r
	IYrq3U0isVo8Vp58uWa1kJy/GBuXyq3dhb8cZR1P6sXY0h0pe0R55hA==
X-Gm-Gg: AYBFou3G5T8sHCBUFIyd7a9VVFVuwvGZ0qfisc0xImG8mvgw634OOGvrRKDX5+L6jNw
	AWOOfsaV0AiOA/tNMo9R5+lKH/N6H5mbHVCHXDX9DHpULX4vbF145TzTpda3okoSSejKanOm3Tt
	dsvLfixihVL0P/M5TNhheljWKDXPuHbAhujf+mOaC7lNXC6ykPa58rExjam93y9SytYz86CNwdZ
	X5QtB0Nep13C4Chnrf98Nn0aH124tEKikqcJsCxxRUB9SmOJstFpnM5qxwSp+M5Si3ABSOSxmOK
	R/K0jKwbJcQpFuWg27rHUReyCDYj01S8mCVnVC9Kc5PGO0WmKXomSgl3D/VnDjgvU9pS1ILAh6r
	znBGPwbfKjF4=
X-Received: by 2002:a05:6a00:4287:b0:89e:779b:d03 with SMTP id
 d2e1a72fcca58-89e779b0f37mr2948665b3a.6.1792116482474; Thu, 15 Oct 2026
 19:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179147329205.58079.5847298721173675285@gmail.com>
 <sashiko-outbox-165773@kernel.org> <CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com>
 <852c9fb6-6217-440a-968c-b5ab3e22dbc8@redhat.com> <179210606199.96599.8994346249690707193@gmail.com>
In-Reply-To: <179210606199.96599.8994346249690707193@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 15 Oct 2026 22:07:50 -0400
X-Gm-Features: AclHuK_xuEKifY20RXuv-jJv4fuayR2c_VgSKs7l2mBdBaAmWeWlt_XO4W1aGGY
Message-ID: <CAHC9VhRbdWFJapUxbOs68+1Mq_BtMqznw+hF_+zFwbOr=_becg@mail.gmail.com>
Subject: Re: [PATCH net v2] calipso: update payload_len when removing the
 CALIPSO option
To: Joas Antonio dos Santos <joasantonio108@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, sashiko-reviews@lists.linux.dev, 
	linux-security-module@vger.kernel.org, network dev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:14=E2=80=AFPM Joas Antonio dos Santos
<joasantonio108@gmail.com> wrote:
>
> On Thu, 15 Oct 2026, Paolo Abeni wrote:
> > The above looks like a pre-existing issue, the patch itself looks
> > correct, right?
>
> Hi Paolo, Paul,
>
> Yes, the issue is pre-existing; the delattr patch doesn't change it.
> The skb_pull()/memmove()/skb_reset_network_header() sequence quoted
> by Sashiko predates this patch, which only adjusts payload_len after
> it.
>
> I tested Paul's idea on top of both CALIPSO patches (QEMU, veth +
> br0 with bridge-nf-call-ip6tables=3D1, SELinux + NetLabel CALIPSO
> DOI 16):
>
> - without it, a bridged CALIPSO packet towards an unlabeled
>   destination reaches the peer with a corrupted Ethernet header
>   (garbage dst MAC, ethertype 0x0000) and is dropped; an unlabeled
>   packet towards a CALIPSO-mapped destination never reaches the peer.
> - with the nf_bridge_info_exists() check in selinux_ip_forward()
>   (plus a stub returning false for CONFIG_BRIDGE_NETFILTER=3Dn),
>   5/5 packets are delivered unmodified in both cases.
> - the routed path is unchanged: delattr 5/5, setattr still adds the
>   option 5/5. W=3D1 is clean with BRIDGE_NETFILTER=3Dy and =3Dn.
>
> Paul, if you like I can send it as a separate selinux patch with your
> Suggested-by.

Yes, please do.  Thanks for working on this!

--=20
paul-moore.com
