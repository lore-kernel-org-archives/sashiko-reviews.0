Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990975;
	b=OX966yVqLWQ7Q8tvcA3sgSowJhVBNUvK8SZ3mDJEE3lxe6XMwyLyFqL85D/AwX5iO1xh
	 dxYaXDZRifgg4UcvtsMzZMvAzTOtlN88UnqSiW8oK2BheFpVzD57SLlllWaTQ4QLKN8LI
	 248dFkBmIZ6Hzj35KOdrFyHYTGXkeR5ffa+8kLAXeQnNQ3k82I/0DOa8TgmNLBUtbqRy+
	 +LlMkcqurqx4L0KgrqYEyqet6ktO0HyQvLBJTpVYEwsJzOzLCjtaoltdvB58BipRD2cAv
	 x2cT75k/FLSrIdqXXvOLjC2nWfEw3bVL/KPkJyLdxC2MmKUUvqjp5WIbbvuRAxVS39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990975;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=Lfe4RFN0Ro1WRk7xZe/QcxmHC8morGpBlZ3uxTIzfHY=;
	b=biWAH4vILP3EAUXhI2Y6gCqAjGm2lOvlzkvG9079MCTTkbvb/Q+UOoYgX7D02P1fu5yw
	 D0c/vHkoLNEOx4QWi/mnuA5LFLxQR5e/GO9cALSAPyrYRFY7DOZ65zaFcAYc8+CdrA7oa
	 wMxMTltGMBEpJwKHYL+N4DOd6Fe2TgCB71sqfNF39OWBBeuK/eIIE/JSTwyzfAH1SYSrb
	 lCc9w3xE5XU2nJj0AmS8lM/H9mIyTPcAOZ2Iyg2TUDxbm+YRVoX3tyQIPqi0hYpBfv0/y
	 0+fjwDBILWPp0EoWHwWR/ovPxe5d8IouYdyl2j7q/2PGUUnFoNG4SQDgYSZCf9PN2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fzYpctr0;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A0606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 05:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 557A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fzYpctr0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792990963; bh=Lfe4RFN0Ro1WRk7xZe/QcxmHC8morGpBlZ3uxTIzfHY=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=fzYpctr0i1OxS71rJH+9tpWDEAgBQSpdFQIYKvUcZM0u2dvyAaVrNjOSC32TLlC25
	 AxA9BV8eyxuuVcKChvFm1hBPav46XBiOSA7xQtc+C+sTEUhkV6o3AJPZltjnPcpAhh
	 XmLHL80FOu4atfaA43KZqXSrrJeezr9tNls9fSC0=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: NL7GWSQ1q2f+xMxeobV05/mMk1y/LvzHrvupAx90fzDrOQzAqDtQUQqDOntRYs
	 TMUCDM1rK3WNmXuhomzikNlzR1tknU4NP4kieQKwFAFcI0Qqvdd5h69QUDEctYZ7HtcVV8yG4viZu
	 7eEkUbEGuTE1udgT/uiWn6JcyBr1S5LTMA5Z6yfre9Vro3z4Rzt6/dcQQl8DMXqGdkY2FVECpcqUT
	 nHGcOnImVZNCFw/LuHlmkUyo3gWfLXBRjB6QWYDZr9MtCsKGFPVcWpMVDU7mtl6XxRNjKtVRd67UD
	 sC4shyHsMF3LdPWzt+8WC7+Gj2S5AsBHIK5VOFwlkToyM+ClL2FQ5FaitGigqI4qAw+WcF3vgH1Cf
	 YHdTWzcQJyLiVjUnY5wuUcCFEw+lhArKTiFqa9Fv7wn16VDoHJ97OCtdAGF3orD3ZMGzF0CP5gtlN
	 ZKdBb5NBgg48r5w++bfq8eoSvBjHWS4A34FkTRKMy/4cf3rGWFsLInhewjyMkU/msJGs3/3Pz6AKf
	 K3eQc/ogR+2hDAycyhKImG+hta9ZrJnfYIoNYQCPHZoKWJ1LQ6qQLuR0NsfKf/yicU5z71CwuDldY
	 Bh4tqCmz8DaZstWiBmiJ2cpVrOj4NJqVJQFB6tf/diKct6L3RHnG8GMMwVjW+rKlWX1PixEwZfBk4
	 x5glWGfz+edoIxgvrNHuv235mS+4lDn3d3bRjZy4lUC88RG184G+83KwyryqOjMxXpxdoGo1WZhl/
	 0L73OeopsPTKkpcu2TZyeQ+zwwtygYHP2O0XTgbxNEfFrlghCceUv1+xn+Ok5LLU1y7atv7gj7CKY
	 Z63EMu1r0sqW/c2YdrtpLFdkBIyhoMtiETRc+ZD4MPhGtFl4NjxyPLxiOJU3sQehmXnSlyNzYE73l
	 aZSmWGU5vUOvwv/Cr7o13nP70LJrSfYr+NH3mhSXEtvtY8oFZWfL14nfHPrbhRAScNZo7SWzge3ny
	 Ad7uBjIJit+/aeVVoWqn+pRj1M1vi8nc09J1i9jTMqGeAE+Eqh+I9l+TWn+TpcKTRbwmtSfTovspv
	 qfDGR0BzmdmLZ/Iv7lbWjRTwvUQ==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: rockchip: Add RK3572 CRU
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 26 Oct 2026 13:02:41 +0800
X-Priority: 3
Message-ID: <tencent_6B487E400FE29A1F4A53388D918C4D82D106@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com>
 <20261023-add-board-ok3572-c-clk-v2-1-90b98836be6e@qq.com>
	<sashiko-outbox-183648@kernel.org>
In-Reply-To: <sashiko-outbox-183648@kernel.org>
X-QQ-mid: xmsezb41-0t1792990961tgobww2pk

SGksCgo+IFtTZXZlcml0eTrCoE1lZGl1bV0KPiBJcyByZXNldCBJRCA0MjEgaW50ZW50aW9u
YWxseSBza2lwcGVkIGJldHdlZW4gU1JTVF9SRVNFVE5fTElOS1NZTV9IRE1JVFhQSFkwCj4g
KDQyMCkgYW5kIFNSU1RfUFJFU0VUTl9QSFBQSFlfQ1JVICg0MjIpPwoKSSBjb25maXJtZWQg
dGhhdCBJRCA0MjEgcGFzc2VzIHRoZSByZXNldCBjb3JlJ3MgcmFuZ2UgY2hlY2sKYW5kIHJl
c29sdmVzIHRvIFNPRlRSU1RfQ09OMDAgYml0IDAgdGhyb3VnaCB0aGUgemVyby1maWxsZWQg
bG9va3VwIGVudHJ5LgpJIHdpbGwgZml4IHRoaXMgaXNzdWUgaW4gdjMuCgo+IFtTZXZlcml0
eTrCoExvd10KPiBTaG91bGQgQ0xLX05SX0NMS1MgYmUgZHJvcHBlZCwgYW5kIHNob3VsZCB0
aGUgc2VjdXJlIGNsb2NrIElEcyBiZQo+IGNvbnRpZ3VvdXMgd2l0aCBQQ0xLX0REUl9NT04g
KDUyNyk/CgpJIHdpbGwgcmVtb3ZlIENMS19OUl9DTEtTIGZyb20gdGhlIGJpbmRpbmcgYW5k
IGNhbGN1bGF0ZSB0aGUgcHJvdmlkZXIgc2l6ZQpmcm9tIHRoZSByZWdpc3RlcmVkIGNsb2Nr
cy4gVGhlIGNsb2NrIElEIGdhcCBpcyBzYWZlIGJlY2F1c2UgdW51c2VkIGNsb2NrCmxvb2t1
cCBlbnRyaWVzIGNvbnRhaW4gYW4gZXJyb3IgcG9pbnRlci4gSSB3aWxsIHJldGFpbiB0aGUg
ZXhpc3Rpbmcgc2VjdXJlCmNsb2NrIElEcy4KCj4gW1NldmVyaXR5OsKgTG93XQo+IFRoZSBl
eGFtcGxlIHVzZXMgMi1zcGFjZSBpbmRlbnRhdGlvbi4gU2hvdWxkIGNsb2NrLW5hbWVzIHVz
ZSBhIGRpcmVjdAo+IGNvbnN0LCBhbmQgc2hvdWxkIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMg
YmUgcmVxdWlyZWQ/CgpJIHdpbGwgZml4IHRoZSBleGFtcGxlIGluZGVudGF0aW9uIGluIHYz
LiBUaGUgc2luZ2xlLWVsZW1lbnQgaXRlbXMgZm9ybQpwYXNzZXMgc2NoZW1hIHZhbGlkYXRp
b24uIFRoZSBpbnB1dCBwcm9wZXJ0aWVzIGFyZSBjdXJyZW50bHkgb3B0aW9uYWwsCmFuZCB0
aGUgZHJpdmVyIHJlc29sdmVzIHhpbjI0bSBieSBpdHMgZ2xvYmFsIGNsb2NrIG5hbWUuCgpC
ZXN0IHJlZ2FyZHMsCkN1bmhhbwoKcHctYm90OiBjcg==

