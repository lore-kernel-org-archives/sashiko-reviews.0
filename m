Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704690;
	b=noxyKXiztmNXpWD1N7ijLhNcqU6r6IvX9hmEw37bl7Dl/uG9WNg1rj3slCv3ikPRzj4Z
	 QFAZZnD7pR0cl45WXSjZTSg+C4gtPSSgP2KB578rxqrf+rPzpKLI3yHrkfzMZTAE2L2EI
	 Z0GFPku4I7ZJvR6S71J4JTee15SCf09OVS70VoxzPP5gCx4pu7Z5evRVMY5HDBxsFtJSZ
	 r3twBrHLFulzSvu+oV3GNhZFsMP484W1CSUqsUwhr3U0IrWez+Nl6QQLYYGRSb8b9wXui
	 Tf1HHwyDdzaGxZTyANEbV6R+v2oE3vw6EB2rcOhuJIN/A+mWDv19fhsdz8t6I7cwHTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
	b=cENfIo0pbIOphXjWCiP6+tbAyWmblHIvWpBrNhOpbhUHMRt+QXoaYY6SZgjxLcxaVoN8
	 bE/a0cO/Kr2WyxCtff9ig22uLlBMr3Uv1tBD9wple7qQmrhj3M4gr3c5aZf+Yk3IRON6B
	 oouyA9o+TulZpam5zHyjZsYyiSip2cllSDbcXwbZR7xuoNDmk+2MC1v9uiNdUGYScD4+V
	 bjkAKEm8prmEmb0nNkxaCeFg+8ox61YM8bZvASONZBvxxIF9LN3KPi3MbctdeAnA8ASut
	 bLuyVBfaQfHoA474XTbyqIGmzSRUCE4aAYQxUdaPST/lwcPUpt5WvIOgBwi1H9ILkoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=alcp+rh2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF29606FAD5
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF29606FAD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=alcp+rh2
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679334baa1fso4313919d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704689; cv=none;
        d=google.com; s=arc-20260327;
        b=RlECM0U6umQJ/HM0C8vPfsxBLYyEaLx+WCwG8fxsOIaC+Ua0SwpGq0VzM9G0yoeJre
         k3QRriULfKNw+sorwwkLvbvbnMOujfmv0CUPyiibl/ugVQak2I0oGV13N5FuZoCuxEgj
         fb+7wCyKU1i337yezfwqjSHI0tnR7Xx5D52dEFPOe2Pji3WZZyli4xfg4YLso+SRPX0S
         M9VmGfHDje6s9O5MNNYpk9HIz4L8wBGwMhl6PniMeh+7l6sgkDz+8N7QLLusjOpaFBoz
         /Y2OdxfheKD3R7Uqh2qJt9rS2JBCm71SVPnHyrmIOLTqMmRWdp1bxryCaic7NaDmu14x
         JlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=ESvulftE4fXm8z5/S2/gOl8g50ZULKQHKNa+ensCGrmq/vlnDrsChs+LSix7+/MYc0
         2Vf/D9XcXPdrOHIFJrPeFntNqbJUzEFv57qD45kcm8kkfpHdNTPBbRTKVFPH9vA7jzoG
         LDRyRcn+vZ1pyjKCEyT43mdRiMJLU3xiXM5DX5um3BxHb6aQW/cTRkJ1RHdJ9BZag9sO
         1c/5UR8QsokVzOtwEQDJPQpRq5/uBLS5tSFd1WKBqjU2eryw+7kUPLtmJRd5UtPpqFRa
         6N2TVYbBMVhVaiEyFT2pwDEcBlN+Q0vyBNSfJE4rf5M363YwKM9P72IVscixdOP5ZhZq
         6uJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793704689; x=1794309489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        b=alcp+rh2twN93iQefp6EUcfziU6reji56wW0RtS+21cRilhgQFUpwZdO/YTg8fADnu
         1kin/uPhUWkAr4dZH05V2g9OokDRjmpIDV3CMx4Wop4XfUNRVa5vBYB66iJ08jucjynb
         5Ksa/+N5dT17uMZoMBX8+OOs2xX8tgqWm9OmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704689; x=1794309489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqccK+cXFG6lKK55WpCC5HbtYlLtHFIvfczx5REOV4o=;
        b=kb184rP5BdhjH8F47B8ZebX9DN+xAEA0sXbV8mSayJAU03LR8B9fTJUeEMMVtgr/Pt
         wvFFP4ZhCJMYUYP7qNCw1b/OOJMDeqBuaeedVetgoragsGygwncF62ciOqI8syo+icFM
         bombLJPS0XWLeQgSkq8xx1eAMlWWceKXqF8cNMcAUch0B7BEme+R2SVOTomAHbtdazz1
         SUzeqo27cfRXmswCamUObp6K6zgh67k23f5TmxHxNPwuN635GjYw2JL+ajkaIqWHQpWF
         redo4pTId8g7YAQE4KOosxy4+z6zKT8vYN6hacEsTJI0TN5bwM+qk1KAZttuYWvAzDSw
         ZGrQ==
X-Gm-Message-State: APuU4Z95qYv/D1nfn6enlmsdGVsceuZ+bT0fOJz66zL5REVaNIQr4Qb2
	JUICL9I6wK/7rhvvjr7ot5Uz3V85vGSu13q+GDHH1p3mTUY2jsDmzMHQ2rwd9kKlrwLrPNEQzmZ
	y1vEP32RY1+kMeKXnVfXhZhrb0r/PBVVET1n11bTWF3JiuTXqwu+z5A==
X-Gm-Gg: AYBFou0yU4/6wFcSs4WqN/lYsVI6Yx//Fj2gc23cgBdXXejXyTkwKWoi57LFGyWZSUs
	xGzltNuxe2ovdGkD/4mQ80EE/b/ymPHWsGBlC71zIlduNvVPCBF/l+8HHwOZ/1efqKk+TtAYpsd
	c3QjJyG2/XMt4lmZ+OeiUMzaXXo9cgkGjwVJGkDzWGF69Iescbiu35DIJltHzJXXwSotF2NRRQ/
	wv+3HKg69sj80i1DI80LM5rWFRmZVXeK5KTHi/F0SmY9KaV4sHA8zdBrNYq/37CeRdpWC5YepEG
	6DtMIdoYw+b9qOH+BuGWXMYaEsuliBwcg3TWXebF6BZOlm8nMzLvawnsCNF2mTsY0/p3Lkkubxn
	QlTnpLOoVMyQieyi6T7P9ZECjY57NieKIH3tZT0JanW2HWW3atSBvdOUPlgDFO6KYJWk=
X-Received: by 2002:a05:690e:4399:b0:679:a03c:3cef with SMTP id
 956f58d0204a3-67ba504fe78mr5463048d50.102.1793704688774; Tue, 03 Nov 2026
 03:18:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103083335.2944847-1-wenst@chromium.org> <20261103083335.2944847-2-wenst@chromium.org>
 <sashiko-outbox-194895@kernel.org>
In-Reply-To: <sashiko-outbox-194895@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Nov 2026 19:17:57 +0800
X-Gm-Features: AclHuK8VonHN09LTCcS6FUt195JMCTKb0pPmw_Dq8fBSu-WL_nXW9IV_jyyzdms
Message-ID: <CAGXv+5GPGs=GOyEsdG9xqHTACSboizTBxg+J0q+tdVsW46Aidw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type C
 port mode and connection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Medium] arm64: dts: mediatek: mt8390-genio: swapped HS and SS USB-C hu=
b endpoints
> - [Medium] arm64: dts: mediatek: mt8390-genio: host data-role breaks TCPM=
 sink and PDOs
> - [Medium] arm64: dts: mediatek: mt8390-genio: partial hub ports graph ma=
rks port 1 unused
> - [Low] arm64: dts: mediatek: mt8390-genio: hub ports nodes violate ti,us=
b8020b schema
> --
>
> commit ef02f781783f3c2d23b3aa255937ed902c67f777
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and conne=
ction
>
> This commit changes the ssusb1 controller's operating mode to "host", dro=
ps
> its usb-role-switch property, updates the Type-C connector's data-role to
> "host", and routes the Type-C port data endpoints through the onboard USB
> hub nodes under xhci1.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/ar=
ch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > index 669eaec662f33..821dbf9d3fc5d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > @@ -512,7 +512,7 @@ rt1715@4e {
> >               connector {
> >                       compatible =3D "usb-c-connector";
> >                       label =3D "USB-C";
> > -                     data-role =3D "dual";
> > +                     data-role =3D "host";
> >                       op-sink-microwatt =3D <10000000>;
> >                       power-role =3D "dual";
> >                       try-power-role  =3D "sink";
>
> [Severity: Medium]
> When data-role is changed to "host" (setting port->typec_caps.data to
> TYPEC_PORT_DFP) while power-role =3D "dual", try-power-role =3D "sink", a=
nd
> PDO_FIXED_DATA_SWAP in sink-pdos and source-pdos remain set, won't this
> cause a data role mismatch and PD capability inconsistency when attaching=
 to
> a USB PD power source?

Rechecked the public documents [1], and it only shows this port supplying
power at 5V/1A. This port is marked as "USB 3.1 PD" on the board, and as
"USB-C 3.1 Host & DisplayPort". The sink / charging type C port is a
different port altogether, marked as "USB-C (charger)".

So the PD description for this port is completely wrong.

[1] https://genio.mediatek.com/doc/iot-yocto/latest/hw/g700-evk.html

> When the port attaches as a Sink in tcpm_snk_attach(), it initializes the
> roles using tcpm_data_role_for_sink():
>
> drivers/usb/typec/tcpm/tcpm.c:
> #define tcpm_data_role_for_sink(port) \
>         ((port)->typec_caps.data =3D=3D TYPEC_PORT_DFP ? \
>         TYPEC_HOST : TYPEC_DEVICE)
>
> Because port->typec_caps.data is TYPEC_PORT_DFP, tcpm_snk_attach() ->
> tcpm_set_roles() sets port->data_role =3D TYPEC_HOST and programs the TCP=
C
> message header data role to DFP while attached as a Sink. When the remote=
 PD
> Source (which also starts as DFP/host per the USB PD specification) sends
> its initial Source_Capabilities message with PD_HEADER_DATA_ROLE =3D 1,
> tcpm_pd_rx_handler() sees both sides as DFP:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_rx_handler() {
>         ...
>                 if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) =
=3D=3D
>                     (port->data_role =3D=3D TYPEC_HOST) && rx_sop_type =
=3D=3D TCPC_TX_SOP) {
>                         tcpm_log(port,
>                                  "Data role mismatch, initiating error re=
covery");
>                         tcpm_set_state(port, ERROR_RECOVERY, 0);
>         ...
> }
>
> In addition, sink-pdos and source-pdos in this connector node still inclu=
de
> PDO_FIXED_DATA_SWAP, which advertises DR_Swap support to the partner via
> tcpm_pd_send_sink_caps() / tcpm_pd_send_source_caps() and exposes
> dual_role_data =3D 1 in sysfs, even though tcpm_pd_ctrl_request() rejects
> incoming PD_CTRL_DR_SWAP requests when port->typec_caps.data !=3D
> TYPEC_PORT_DRD.
>
> [ ... ]
>
> > @@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
> >               peer-hub =3D <&hub_3_0>;
> >               reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> >               vdd-supply =3D <&usb_hub_fixed_3v3>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_2_0_p2: endpoint {
> > +                                     remote-endpoint =3D <&typec_con_h=
s>;
> > +                             };
> > +                     };
> > +             };
> >       };
> >
> >       hub_3_0: hub@2 {
> > @@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
> >               peer-hub =3D <&hub_2_0>;
> >               reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> >               vdd-supply =3D <&usb_hub_fixed_3v3>;
> > -     };
> >
> > -     port {
> > -             xhci_ss_ep: endpoint {
> > -                     remote-endpoint =3D <&typec_con_ss>;
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_3_0_p2: endpoint {
> > +                                     remote-endpoint =3D <&typec_con_s=
s>;
> > +                             };
> > +                     };
> >               };
> >       };
> >  };
>
> [Severity: Medium]
> Are the High-Speed and SuperSpeed endpoints connected to the wrong hubs h=
ere?
>
> In drivers/usb/misc/onboard_usb_dev.c (onboard_dev_id_table) and
> Documentation/devicetree/bindings/usb/ti,usb8020b.yaml, TI USB8020B produ=
ct
> ID 0x8025 (compatible "usb451,8025") is the USB 3.0 SuperSpeed hub and
> product ID 0x8027 (compatible "usb451,8027") is the USB 2.0 High-Speed hu=
b:
>
> drivers/usb/misc/onboard_usb_dev.c:
>         { USB_DEVICE(VENDOR_ID_TI, 0x8025) }, /* TI USB8020B 3.0 HUB */
>         { USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */
>
> In mt8390-genio-common.dtsi, hub@1 has compatible =3D "usb451,8025" (the =
3.0
> hub) and hub@2 has compatible =3D "usb451,8027" (the 2.0 hub), even thoug=
h
> their pre-existing DT labels hub_2_0 and hub_3_0 are reversed. Placing
> usb_2_0_p2 (linked to typec_con_hs, port@0) under hub@1 and usb_3_0_p2
> (linked to typec_con_ss, port@1) under hub@2 connects the High-Speed Type=
-C
> endpoint to the SuperSpeed hub and the SuperSpeed Type-C endpoint to the
> High-Speed hub.

Yeah, they are definitely swapped. 0x8025 is the default PID for USB 3.0
while the default PID for USB 2.0 is the 3.0 one XOR 0x2.

> [Severity: Medium]
> Does adding a ports node containing only port@2 to hub@1 and hub@2 cause
> downstream port 1 of the TI USB8020B hub to be marked as USB_PORT_NOT_USE=
D
> and non-removable?
>
> When a USB hub is enumerated, usb_hub_create_port_device() calls
> usb_of_get_connect_type() for each downstream port:
>
> drivers/usb/core/of.c:usb_of_get_connect_type() {
>         ...
>         /* Only set connect_type if binding has ports/hardwired devices. =
*/
>         if (!usb_of_has_devices_or_graph(hub))
>                 return USB_PORT_CONNECT_TYPE_UNKNOWN;
>
>         /* Assume port is unused if there's a graph or a child node. */
>         connect_type =3D USB_PORT_NOT_USED;
>         ...
> }
>
> Previously, hub@1 and hub@2 had no child nodes or OF graph, so all
> downstream ports defaulted to USB_PORT_CONNECT_TYPE_UNKNOWN. Once ports i=
s
> added with only port@2 defined, usb_of_has_devices_or_graph(hub) returns
> true and downstream port 1 (which has neither a port@1 graph node nor a
> child device node) returns USB_PORT_NOT_USED, causing
> set_usb_port_removable() in drivers/usb/core/hub.c to mark any device plu=
gged
> into downstream port 1 as DEVICE_FIXED.

The other port seems to be tied to a M.2 B-key slot on the reverse side
of the board. Currently, we still lack proper M.2 slot USB integration,
so this is going to be a slight problem.

> [Severity: Low]
> Also, does adding ports child nodes to hub@1 ("usb451,8025") and hub@2
> ("usb451,8027") fail dtbs_check against
> Documentation/devicetree/bindings/usb/ti,usb8020b.yaml?
>
> Unlike ti,usb8041.yaml (which references usb-hub.yaml# and uses
> unevaluatedProperties: false), ti,usb8020b.yaml only references
> usb-device.yaml# and sets additionalProperties: false without defining a
> ports property.

I sent a separate patch to address this by merging ti,usb8020b into
ti,usb8041.


The AI review is certainly digging up more problems with the DT.

ChenYu
