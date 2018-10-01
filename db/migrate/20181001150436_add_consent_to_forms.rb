class AddConsentToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :consent, :string, null: false, default: "Wyrażam zgodę na przetwarzanie moich danych osobowych w procesie rekrutacji na w.w. stanowisko i prowadzonego przez firmę „Przykładowa Firma” sp. z o.o. Jednocześnie oświadczam, że zostałam/em poinformowana o przysługującym mi prawie dostępu do treści moich danych oraz ich poprawiania, wycofania zgody na ich przetwarzanie w każdym czasie, jak również, że podanie tych danych było dobrowolne."
  end
end
