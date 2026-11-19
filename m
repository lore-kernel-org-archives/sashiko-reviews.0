Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104874;
	b=T16WUDNV793n3KiaZgNwy7UTG9iuOtxjw1fQG684tYcFyUPky1MTe94xbyP4fj84CBEj
	 Jp1fZ+fzFjhU+uk7XnOmRcGxxGfTG3RufyarAvYaLkHPnNJ8uIVap2LN/uWM2e149XLgc
	 7d1V6gw5O7f/uRdaAIyLqHYLw9LFOfcsMjBx+k5b930NwKfKQghvDGJ7VpzGzAZZIhCBI
	 qlNRMkQpXjMyM6+cxCDWlC6lmB3jBdgWW2HdEbXdbV2aGndkmpaA59Y3Y9F1WldC56Cmi
	 pcCqaJb7eUhgfkNuOKMBM+DG0xQJsprNdXDsMWtRiAK/j8IEoOnFItmYR2cYjG3TL7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104874;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AM2+E8sEzy5CYe3kVbBXC1FQoolZE9wvLxle/doQMnQ=;
	b=gb+WzlJWrR5Jrc7C9Ik6F/AGZZrZWwpUD8yAx8lMAv4eyp901VhpMj83m2hTEazQf6J2
	 FGg93bq0cSxZvOYZMwMAjoy5mfo9OCD7E1bnbm/c9VC4ljDe1vXGK6V5ChCkBdyc9wMsk
	 2/QDNZiihQ/MVbXvEJpanNXA2FwWSxJK0L48wIMKXPkliDw2h6rihOP8fnLHttWb+7G6m
	 7RVkOvkyP3FJskm/Eg9m2PUvRdb9VI9EVW7m6r8vDvFL/y2ZefHqyRhKoV6RPvdysV8mH
	 0m5FFsSUzXIHzSy7BTLGMqJtDrJx/89B5KwJMMjxwp5ErhvLCJ+cer4fH9FZBqByDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4QyAvJQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC66606A320;
	Thu, 19 Nov 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4QyAvJQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8A71F000C6;
	Thu, 19 Nov 2026 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104874;
	bh=AM2+E8sEzy5CYe3kVbBXC1FQoolZE9wvLxle/doQMnQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=G4QyAvJQpdNU0jk12xjoSYlMUS9MNN82jI+6eFR7mH1nmbfDycn01fFaPWQkV3QVA
	 QfqoAdtoslOEf/k39SAjaPfNqqKJT09+VKFBEmddMNiBjFZ1yQ7hp36OkVDt7+w6UP
	 DNOTB8SxtCkX1uczSgfPq/j5Cf7+nT2A75NfzvyhPb34zWXfxuOpf/UcHlplCrTn78
	 g9qUyNRr/sAUFV9MUFJjWad2YEFNzORtcFyEHLQhQaP97fY9ziCgHn3ORoFOFf+ZBW
	 lrg4UXGOqBUbmkderW0W086JkeANShAx1NLaDE1WikCwC+vDc3s58XMpWuRwrGOfYb
	 FjHkfYU/7Itbw==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
From: bod@kernel.org
To: sashiko-reviews@lists.linux.dev
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 media-ci@linuxtv.org
In-Reply-To: <sashiko-outbox-191924@kernel.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
 <sashiko-outbox-191924@kernel.org>
Date: Thu, 19 Nov 2026 16:14:31 +0000
Message-Id: <179510487111.2846709.3078135304789548388.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256; i=bod@kernel.org;
 h=from:subject:message-id; bh=qFUJrFdqhCUGoUnHIH8dqJ/GmGIxi1Acp32pGNf4s+I=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/yBnpb35s1nQwRHytczkioGDUwTiS+sh0wHqM
 NSVL315/BaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav8gZwAKCRAicTuzoY3I
 OibfD/45J1R63tOjipxshcBwnN4Ml2E8PkAPu9PpEah6xVtFGiUBxdHW8l/wIUsuC9hspORl6gB
 PO/5aSAuGDANR1TkEgBW/N+vOUuPX559Bx2nxN+arEtLGVTAQCruLiFhmLew7+oIX6vkaKJ5yJz
 vcydOiSqO37eURdGAnZe4Zcv1kExoDCN61TLRt56MaEuVq1sbom7bVZlQdQWBxANP4TN2kpo62k
 iQ6rTJoW5yQd6wZSQFvfg3ae84OwXyjIype6wzjPIk5uLYxQ1K2PhEhqo6KhuW9XbqxuAT3vGsm
 CUnJYrhCGj+h58FoeG2Q3AuNTNV0GPHLKaVlYBReX83lw3IHvVG+34+1fyLuaHsNPBNqavyrn+N
 B33Joh9DcLolifAzJz3gMT2Y44Y5KZrPe+3+FMt9+ml23vsN1LTuz8E3/oaCmwxmZDfcrD+9V9I
 M1TwUSQHYBitrHF97Jqxus/Y5cIpgpz5z29759nmVZoA//Eq/eEVDXsLWcxW6+r8orZ2gWg8usu
 TvaSFF+hCmjL02off049L7kct8PaxLLrb0B2TUHnMRvmYYAXRlfYyYoXLbv+Rr7h8FImyZRVxis
 4MbSir2j0o536xPRimyjecrBay9fSMeQVfiV3OL/ZVepxhBY3jk5kOFb98BnpAKx/aqtDxVnNfd
 ZbLFPucJZot6tcw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-31 11:34 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: media: qcom,sm8650-camss: missing minItems on reg and clocks
> --
> 
> commit e38622494d300e76674ad2714e0222a5d2a3e220
> Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
> 
> This commit adds the three test pattern generator (TPG) register spaces and
> the non-real time CAMNOC AXI clock to the Qualcomm SM8650 CAMSS device tree
> binding schema.
> 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> > index 9c8de722601ec..50ae30cdcb82a 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> > @@ -17,7 +17,7 @@ properties:
> >      const: qcom,sm8650-camss
> >  
> >    reg:
> > -    maxItems: 17
> > +    maxItems: 20
> >  
> >    reg-names:
> >      items:
> > @@ -38,9 +38,12 @@ properties:
> >        - const: vfe2
> >        - const: vfe_lite0
> >        - const: vfe_lite1
> > +      - const: tpg0
> > +      - const: tpg1
> > +      - const: tpg2
> >  
> >    clocks:
> > -    maxItems: 33
> > +    maxItems: 34
> >  
> >    clock-names:
> >      items:
> > @@ -77,6 +80,7 @@ properties:
> >        - const: vfe_lite_ahb
> >        - const: vfe_lite_cphy_rx
> >        - const: vfe_lite_csid
> > +      - const: camnoc_nrt_axi
> 
> [Severity: Medium]
> Should reg and reg-names specify minItems: 17, and should clocks and
> clock-names specify minItems: 33 in
> Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml?
> 
> In dtschema, increasing maxItems on reg from 17 to 20 and on clocks from
> 33 to 34 (while appending tpg0, tpg1, tpg2 to reg-names and camnoc_nrt_axi
> to clock-names) without specifying minItems implicitly sets minItems equal
> to maxItems. This makes the newly added TPG register blocks and clock
> mandatory rather than optional.

Vlad this seems like reasonable feedback, can we address ?
---
bod

